all: 
	mkdir -p srcs/html
	@sudo docker compose -f ./srcs/docker-compose.yml up

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

re: clean
	mkdir -p srcs/html
	@sudo docker compose -f srcs/docker-compose.yml up --build

clean:
	sudo rm -rf srcs/html

.PHONY: all re down clean