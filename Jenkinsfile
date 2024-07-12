

pipeline {
  agent any

  parameters {
    choice(
      name: 'TF_ENVIRONMENT',
      description: 'Terraform environment directory',
      choices: ['k8s-cluster', 'load-balancer', 'vault']
    )
  }

  environment {
    TF_ENVIRONMENT = "${params.TF_ENVIRONMENT}"
  }

  stages {
    stage('Prepare environment') {
      parallel {
        stage('.env') {
          steps {
            withCredentials([
              vaultFile(credentialsId: 'terraform-proxmox.terraform.dotenv', variable: 'DOTENV_PATH')
            ]) {
              sh 'cp $DOTENV_PATH $WORKSPACE/.env'
            }
          }
        }

        stage('terraform.tfvars') {
          steps {
            withCredentials([
              vaultFile(credentialsId: 'terraform-proxmox.terraform.terraform-tfvars', variable: 'TERRAFORM_TFVARS_PATH')
            ]) {
              sh 'cp $TERRAFORM_TFVARS_PATH $WORKSPACE/environments/${TF_ENVIRONMENT}/terraform.tfvars'
            }
          }
        }
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'make init-${TF_ENVIRONMENT}-state'
      }
    }

    stage('Terraform Plan') {
      steps {
        dir("environments/${TF_ENVIRONMENT}") {
          sh 'terraform plan -out=plan.out'
          stash name: "tf-plan-output", includes: "**/plan.out"
        }
      }

      post {
        success {
          echo "Reporting Terraform plan result"
        }
      }
    }

    stage('Terraform Apply') {
      when {
        branch 'master'
        buildingTag()
      }

      steps {
        dir("environments/${TF_ENVIRONMENT}") {
          unstash 'tf-plan-output'
          sh 'terraform apply plan.out'
        }
      }

      post {
        success {
          echo "Reporting apply results"
        }
      }
    }
  }
}
