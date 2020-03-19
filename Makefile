.PHONY: help init rebuild exec
.DEFAULT_GOAL := help

DOCKER_IMAGE=node:12.16.1
APP_NAME=a11radio
APP_PORT=8000
NODE_DEBUG_PORT=7000
DOCKER_CONTAINER_NAME=$(APP_NAME)
WATCH?=true

help:
	#source:http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


run-docker:
	@-docker rm -f $(DOCKER_CONTAINER_NAME)
	@docker run --rm \
		$(DOCKER_OPTS) \
		$(DOCKER_PORTS) \
		--name=$(DOCKER_CONTAINER_NAME) \
		--volume `pwd`:/root/app/ \
		--workdir /root/app/ \
		$(DOCKER_IMAGE) $(DOCKER_CMD)

init: DOCKER_CONTAINER_NAME=$(APP_NAME)-init
init: DOCKER_CMD=npm install
init: DOCKER_OPTS=-it
init: run-docker
init: ## Recreates the node modules folder locally by running npm install

rebuild: ## Rebuild the Docker image for local dev
	docker build . -t a11radio:latest

dev: DOCKER_IMAGE=a11radio:latest
dev: DOCKER_CONTAINER_NAME=$(APP_NAME)
dev: DOCKER_PORTS=-p 8000:$(APP_PORT)
dev: DOCKER_CMD=npm run develop
dev: DOCKER_OPTS=-it
dev: run-docker
dev: ## Exec into a new container

exec: DOCKER_IMAGE=a11radio:latest
exec: DOCKER_CONTAINER_NAME=$(APP_NAME)
exec: DOCKER_PORTS=-p 8000:$(APP_PORT)
exec: DOCKER_CMD=bash
exec: DOCKER_OPTS=-it
exec: run-docker
exec: ## Exec into a new container
