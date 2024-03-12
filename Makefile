all: 
	@mkdir -p /home/astachni/data/html
	@mkdir -p /home/astachni/data/mariadb
	@sudo docker compose -f ./srcs/docker-compose.yml up

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down


clean: delete
	@sudo docker compose -f ./srcs/docker-compose.yml down -v

delete:
	@sudo rm -rf /home/astachni/data/html
	@sudo rm -rf /home/astachni/data/mariadb
	@sudo docker system prune -a

build:
	@mkdir -p /home/astachni/data/html
	@mkdir -p /home/astachni/data/mariadb
	@sudo docker compose -f ./srcs/docker-compose.yml build

re: clean build all

.PHONY: all re down clean delete