include .env
.PHONY: help
.DEFAULT_GOAL := help

help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'


init-state-aws-vrsfactory: ## Inits "aws-vrsfactory" terraform state
	@echo "Initializing 'AWS for vrs-factory' state ..."
	@cd aws/core && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-aws-vrsfactory.tfstate"


init-state-cloudflare-vrsfactorydev: ## Inits "cloudflare-vrsfactorydev" terraform state
	@echo "Initializing 'Cloudflare for vrs-factory.dev' state ..."
	@cd cloudflare/zone_vrs-factory.dev && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-cloudflare-vrsfactorydev.tfstate"

init-state-cloudflare-vrsfactorypl: ## Inits "cloudflare-vrsfactorypl" terraform state
	@echo "Initializing 'Cloudflare for vrs-factory.pl' state ..."
	@cd cloudflare/zone_vrs-factory.pl && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-cloudflare-vrsfactorypl.tfstate"

init-state-cloudflare-vrsfin: ## Inits "cloudflare-vrsfin" terraform state
	@echo "Initializing 'Cloudflare for vrsf.in' state ..."
	@cd cloudflare/zone_vrsf.in && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-cloudflare-vrsfin.tfstate"


init-state-proxmox: ## Inits "proxmox" terraform state
	@echo "Initializing 'Homelab Proxmox' state ..."
	@cd proxmox && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-proxmox.tfstate"
