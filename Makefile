ENV_ARG ?= $(or $(ENV_FILE),.envtest)
ifneq (,$(wildcard ./$(ENV_ARG)))
    include $(ENV_ARG)
    export
endif

PROJECT_ROOT := $(realpath .)
CONFIG_PATHS = config/traefik config/pangolin config/letsencrypt
SHELL := bash

check_config_dir:
	@echo "Project root: $(PROJECT_ROOT)"
	@for conf_path in $(CONFIG_PATHS) ; do \
		if [ -d $(PROJECT_ROOT)/$$conf_path ]; then \
    		echo "'$$conf_path' folder exists."; \
    	else \
			echo "Creating dir: $$conf_path"; \
			mkdir -p $$conf_path; \
    	fi; \
	done

fill_templates:
	@echo "Filling templates with env vars..."
	@envsubst < $(PROJECT_ROOT)/templates/config/traefik/dynamic_config.yml.tpl > $(PROJECT_ROOT)/config/traefik/dynamic_config.yml
	@envsubst < $(PROJECT_ROOT)/templates/config/traefik/traefik_config.yml.tpl > $(PROJECT_ROOT)/config/traefik/traefik_config.yml
	@envsubst < $(PROJECT_ROOT)/templates/config/pangolin/config.yml.tpl > $(PROJECT_ROOT)/config/pangolin/config.yml

terraform_plan:
	pushd terraform; \
	terraform plan -var-file=tfvars/dev.tfvars -out tfplan; \
	popd

terraform_apply:
	pushd terraform; \
	terraform apply -auto-approve -var-file=tfvars/dev.tfvars tfplan; \
	popd

terraform_destroy:
	pushd terraform; \
	terraform destroy -auto-approve -var-file=tfvars/dev.tfvars; \
	popd

all: check_config_dir fill_templates
