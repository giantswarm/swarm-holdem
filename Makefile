# standard info
PROJECT = holdem
REGISTRY = registry.giantswarm.io
USERNAME := $(shell swarm user)
ORG := $(shell swarm env | cut -d/ -f1)
SLACK_TOKEN="xoxb-10023012097-Nw7snCikE770UpvcS5tFkNCg"

# local info
MY_IP = $(shell boot2docker ip)

token:
	echo $(SLACK_TOKEN) > token.txt

build:
	docker build -t $(REGISTRY)/$(USERNAME)/$(PROJECT) .

run: token build
	@echo "##########################################################################"
	@echo "Your service $(PROJECT) will be running via Slack."
	@echo "##########################################################################"

	docker run --rm -ti \
		$(REGISTRY)/$(USERNAME)/$(PROJECT)

push: token build
	docker push $(REGISTRY)/$(USERNAME)/$(PROJECT)

pull:
	docker pull $(REGISTRY)/$(USERNAME)/$(PROJECT)

up: push
	swarm up \
	  --var=project=$(PROJECT) \
	  --var=org=$(ORG)

	@echo "##########################################################################"
	@echo "Your service '$(PROJECT)' will be running via Slack."
	@echo "##########################################################################"
