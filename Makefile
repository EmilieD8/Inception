DATA_DIR := /home/edrouot/data

all: create_directories docker_up

create_directories:
	@if [ ! -d "$(DATA_DIR)" ]; then \
		mkdir -p $(DATA_DIR)/wordpress; \
		mkdir -p $(DATA_DIR)/mariadb; \
	fi

docker_up: create_directories
	@sudo docker-compose -f srcs/docker-compose.yml up -d

down:
	@sudo docker-compose -f srcs/docker-compose.yml down --rmi all -v

re: down docker_up

fclean:
	@sudo docker system prune -a

.PHONY: all create_directories docker_up down re fclean
