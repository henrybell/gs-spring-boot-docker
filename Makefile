build: ## Build package with Maven
	mvn package

clean: ## Clean artifacts
	mvn clean 

image: ## Make Docker image
	mvn install dockerfile:build

push: ## Push docker image
	mvn dockerfile:push

.PHONY: help build
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
