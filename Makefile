ENV_ARG ?= $(or $(ENV_FILE),.envtest)
ifneq (,$(wildcard ./$(ENV_ARG)))
    include $(ENV_ARG)
    export
endif

PROJECT_ROOT := $(realpath .)
CONFIG_PATHS = config config/traefik config/pangolin
SHELL := bash

check_config_dir:
	@echo "Project root: $(PROJECT_ROOT)"
	@for conf_path in $(CONFIG_PATHS) ; do \
		if [ -d $(PROJECT_ROOT)/$$conf_path ]; then \
    		echo "'$$conf_path' folder exists."; \
    	else \
			echo "config folder $(PROJECT_ROOT)/$$conf_path does not exist."; \
			$(MAKE) create_dir_config; \
    	fi; \
	done

create_dir_config:
	@mkdir -p $(PROJECT_ROOT)/config/{traefik,pangolin}

fill_templates:
	envsubst < $(PROJECT_ROOT)/templates/config/traefik/dynamic_config.yaml.tpl > $(PROJECT_ROOT)/config/traefik/dynamic_config.yaml

	envsubst < $(PROJECT_ROOT)/templates/config/traefik/traefik_config.yaml.tpl > $(PROJECT_ROOT)/config/traefik/traefik_config.yaml

	envsubst < $(PROJECT_ROOT)/templates/config/pangolin/config.yaml.tpl > $(PROJECT_ROOT)/config/pangolin/config.yaml

all: check_config_dir fill_templates
