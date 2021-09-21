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
	

.PHONY: start
start: ## Start the slate docker container
	$(info $(M) Starting an instance of slate)
	@docker stack rm slate
	@docker stack deploy -c ./docker/docker-compose.yml slate

.PHONY: stop
stop: ## Stopping running slate instances
	$(info $(M) Stopping slate instance)
	@docker stack rm slate

.DEFAULT_GOAL := help