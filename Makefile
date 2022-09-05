
all:
	docker-compose -f src/docker-compose.yml up

fclean:
	docker-compose -f src/docker-compose.yml down