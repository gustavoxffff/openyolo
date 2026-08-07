
.PHONY: build run

COMPOSE := $(shell \
	command -v podman-compose >/dev/null 2>&1 && echo "podman-compose" || echo "docker compose" \
)

check-compose:
ifeq ($(COMPOSE),)
	$(error No composer found! install docker compose or podman-composer)
endif

build: check-compose
	rm -rf ./context/opencode
	cp -rL ~/.config/opencode ./context/opencode
	$(COMPOSE) build

up: build
	$(COMPOSE) up -d --force-recreate

shell:
	$(COMPOSE) exec openyolo /bin/bash

opencode:
	$(COMPOSE) exec openyolo opencode

stop:
	$(COMPOSE) stop

clean:
	$(COMPOSE) down
