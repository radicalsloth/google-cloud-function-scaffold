GCP_PROJECT_ID=`cat settings.txt | sed -n 1p`
CLOUD_FUNCTION_NAME=`cat settings.txt | sed -n 2p`
blue=\033[0;34m
normal=\033[m


.PHONY: run
run:
	@echo "Starting local server"
	docker-compose up

.PHONY: up
up:
	docker-compose up -d

.PHONY: deploy
deploy:
	@printf "%b" "${normal}Deploying ${blue}$(CLOUD_FUNCTION_NAME)${normal} to ${blue}$(GCP_PROJECT_ID)${normal}\n"
	@gcloud functions deploy $(CLOUD_FUNCTION_NAME) --project $(GCP_PROJECT_ID) --runtime python37 --trigger-http --entry-point main --source ./cloud_function/

.PHONY: build
build:
	docker-compose build

.PHONY: stop
stop:
	docker-compose down

.PHONY: down
down:
	docker-compose down

.PHONY: rebuild
rebuild:
	make stop && make build && make run
