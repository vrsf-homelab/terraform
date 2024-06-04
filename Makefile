include .env
.PHONY: help
.DEFAULT_GOAL := help

help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'


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
