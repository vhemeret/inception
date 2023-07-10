all: 
	mkdir -p /home/vahemere/data/mariadb
	mkdir -p /home/vahemere/data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml build #--progress=plain
	sudo docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	sudo docker container stop nginx mariadb wordpress
	sudo docker network rm inception

fclean: clean
	@sudo rm -rf /home/vahemere/data/mariadb/*
	@sudo rm -rf /home/vahemere/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean
