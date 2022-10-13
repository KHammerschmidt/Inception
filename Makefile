# **************************************************************************** #
#   COLORS                                                                     #
#   COM_COLOR=blue, OBJ_COLOR=green, ERROR_COLOR=red, WARN_COLOR=yellow        #
# **************************************************************************** #
COM_COLOR   := \033[0;34m
OBJ_COLOR   := \033[0;32m
ERROR_COLOR := \033[0;31m
WARN_COLOR  := \033[0;33m

# **************************************************************************** #
#   VARIABLES                                                                  #
# **************************************************************************** #
NAME		:=	inception

# **************************************************************************** #
#   RULES                                                                      #
# **************************************************************************** #
.PHONY: all clean fclean re

all: $(NAME)

$(NAME):
	@mkdir -p /home/khammers/data/wordpress
	@mkdir -p /home/khammers/data/mariadb
	@echo "$(COM_COLOR)...setting up volumes /data/wordpress & /data/mariadb" 
	@sudo docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml up -d --build
	@echo "$(COM_COLOR)...creating: $(NAME)" 

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

fclean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down --volumes
	@sudo rm -rf /home/khammers/data/mariadb
	@sudo rm -rf /home/khammers/data/wordpress
	@echo "$(ERROR_COLOR)...$(NAME) deleted"
	@echo "$(ERROR_COLOR)...volumes deleted"

reload:
	@sudo docker-compose --env-file ./srcs/.env -f ./srcs/docker-compose.yml up -d
	@echo "$(COM_COLOR)...reloading docker files" 

re: fclean all
