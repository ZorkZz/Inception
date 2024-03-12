start: 
	@mkdir -p /home/astachni/data/html
	@mkdir -p /home/astachni/data/mariadb
	@sudo docker compose -f ./srcs/docker-compose.yml up

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down


delete: clean
	@sudo docker compose -f ./srcs/docker-compose.yml down -v

clean:
	@sudo rm -rf /home/astachni/data/html
	@sudo rm -rf /home/astachni/data/mariadb

build:
	@mkdir -p /home/astachni/data/html
	@mkdir -p /home/astachni/data/mariadb
	@sudo docker compose -f ./srcs/docker-compose.yml build

re: delete build all

.PHONY: all re down clean delete