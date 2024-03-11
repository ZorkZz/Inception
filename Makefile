all: 
	mkdir -p srcs/html
	mkdir -p srcs/sql
	@sudo docker compose -f ./srcs/docker-compose.yml up

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down


delete: clean
	@sudo docker compose -f ./srcs/docker-compose.yml down -v

clean:
	sudo rm -rf srcs/html
	sudo rm -rf srcs/sql

build:
	sudo docker compose -f ./srcs/docker-compose.yml build --no-cache

re: delete all

.PHONY: all re down clean delete