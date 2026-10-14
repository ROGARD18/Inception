DATA_DIR = /home/anrogard/data
COMPOSE_FILE = ./srcs/docker-compose.yml
COMPOSE_CMD = DATA_DIR=$(DATA_DIR) DOCKER_BUILDKIT=0 docker compose -f $(COMPOSE_FILE)

all: up

up:
	@mkdir -p $(DATA_DIR)/mariadb
	@mkdir -p $(DATA_DIR)/wordpress
	$(COMPOSE_CMD) up --build -d

down:
	$(COMPOSE_CMD) down

clean:
	$(COMPOSE_CMD) down -v
	docker system prune -f

fclean: clean
	@rm -rf $(DATA_DIR)
	docker system prune -af --volumes

re: fclean all

.PHONY: all up down clean fclean re