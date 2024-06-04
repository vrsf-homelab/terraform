pipeline {
  agent any
  stages {
    stage('Change directory') {
      steps {
        dir(path: 'cloudflare/zone_vrsf.in')
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      agent any
      steps {
        sh 'terraform apply -auto-approve'
      }
    }

  }
}