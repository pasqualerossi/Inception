all:
	@sudo hostsed add 127.0.0.1 prossi.42.fr && echo "successfully added prossi.42.fr to /etc/hosts"
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@sudo hostsed rm 127.0.0.1 prossi.42.fr && echo "successfully removed prossi.42.fr to /etc/hosts"
	@if [ -d "/home/prossi/data/wordpress" ]; then \
	sudo rm -rf /home/prossi/data/wordpress/* && \
	echo "successfully removed all contents from /home/prossi/data/wordpress/"; \
	fi;

	@if [ -d "/home/prossi/data/mariadb" ]; then \
	sudo rm -rf /home/prossi/data/mariadb/* && \
	echo "successfully removed all contents from /home/prossi/data/mariadb/"; \
	fi;

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, clean, fclean, re, ls