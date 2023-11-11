USERNAME ?= huaydin
COMPOSE_FILE = srcs/docker-compose.yml
DB_VOLUME = ${HOME}/data/mariadb
WP_VOLUME = ${HOME}/data/wordpress
DB_DOCKER_VOLUME = mariadb
WP_DOCKER_VOLUME = wordpress

.PHONY: all up down stop logs clean fclean re create-volumes update-hosts

all: up

up: create-volumes update-hosts
	docker-compose -f $(COMPOSE_FILE) up --build -d

down:
	@docker-compose -f $(DOCKER_COMPOSE_FILE) down --remove-orphans

stop:
	docker-compose -f $(COMPOSE_FILE) stop

logs:
	docker-compose -f $(COMPOSE_FILE) logs

clean: down
	@docker container prune --filter "label=com.docker.compose.project=srcs" --force

fclean: clean
	sudo rm -rf $(DB_VOLUME) $(WP_VOLUME)
	docker system prune --all --volumes --force --filter "label=com.docker.compose.project=srcs"
	docker volume rm $(DB_DOCKER_VOLUME) $(WP_DOCKER_VOLUME) -v --force

re: fclean all

create-volumes:
	mkdir -p $(DB_VOLUME) $(WP_VOLUME)

update-hosts:
	grep -qE '127.0.0.1[[:space:]]+$(USERNAME).42.fr' /etc/hosts || echo '127.0.0.1 $(USERNAME).42.fr' | sudo tee -a /etc/hosts
