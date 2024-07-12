include .env
.PHONY: help
.DEFAULT_GOAL := help

help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

init-proxmox-kubernetes: ## Inits Proxmox's "kubernetes" state
	@echo "Initializing 'Proxmox' state ..."
	@cd environments/proxmox/kubernetes && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-proxmox.tfstate"

init-proxmox-load-balancer: ## Inits Proxmox's "load-balancer" state
	@echo "Initializing 'Load Balancer' state ..."
	@cd environments/proxmox/load-balancer && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-proxmox-lb.tfstate"

init-cloudflare: ## Inits Cloudflare state
	@echo "Initializing 'Cloudflare' state ..."
	@cd environments/cloudflare && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-cloudflare-vrsfin.tfstate"

init-vault: ## Inits "vault" state
	@echo "Initializing 'Vault' state ..."
	@cd environments/vault && terraform init \
	-reconfigure \
	-backend-config="access_key=$(AWS_ACCESS_KEY_ID)" \
	-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)" \
	-backend-config="key=state-proxmox-vlt.tfstate"
