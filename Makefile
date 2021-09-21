M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: build
build: ## Build project for slate application
	$(info $(M) Build project for slate application)
ifndef PROJECT_NAME
	$(error PROJECT_NAME is not set !(Use "PROJECT_NAME=..." before the build command) )
endif

	_UID=$(shell id -u) GID=$(shell id -g) docker build --rm -t "localhost/builder-node:latest" -f ./docker/Dockerfile.swagger .
	_UID=$(shell id -u) GID=$(shell id -g) PROJECT_NAME=${PROJECT_NAME} docker-compose -f docker/docker-compose.builder.yml up builder 

.PHONY: start
start: ## Start the slate docker container
	$(info $(M) Starting an instance of slate)
ifndef PROJECT_NAME
	$(error PROJECT_NAME is not set !(Use "PROJECT_NAME=..." before the build command) )
endif
	@docker stack rm slate
	@PROJECT_NAME=${PROJECT_NAME} docker stack deploy -c ./docker/docker-compose.yml slate

.PHONY: stop
stop: ## Stopping running slate instances
	$(info $(M) Stopping slate instance)
	@docker stack rm slate

.DEFAULT_GOAL := help