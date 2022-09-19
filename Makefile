NAME = inception

all: $(NAME)

$(NAME):
	mkdir -p /home/khammers/data/wordpress
	mkdir -p /home/khammers/data/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up --build

clean:
	sudo docker-compose -f srcs/docker-compose.yml down

fclean:
	sudo docker-compose -f srcs/docker-compose.yml down --volumes
	sudo rm -rf /home/khammers/data/mariadb
	sudo rm -rf /home/khammers/data/wordpress

reload:
	sudo docker-compose -f srcs/docker-compose.yml up

re: fclean all