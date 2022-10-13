# Inception

System Administration related exercise of 42 Heilbronn core curriculum.

Task: Setting up a small infrastructure composed of different services under specific rules.
      Virtualize several Docker images in a personal virtual machine.
       - Set up: a Docker container that contains NGINX with TLSv1.2 or TLSV1.3 only;
                 a Docker container that contains WordPress + php-fpm, installed & configured without nginx;
                 a Docker container that contains MariaDB, without nginx;
                 a volume that contains WordPress database and one that contains WordPress website files;
                 a docker-network that established a connection between the containers
       - Domain name has to point to local IP address.
      
Rules:
      - Containers must be built from penultimate stable version of Debian Buster
      - The NGINX container must be the only entrypoint into the infrastructure via port 443 only 
      - One Dockerfile per service has to be written, ready-made Docker images are not allowed
      - It is mandatory to use environment variables
  
  Example of the expected result
  ![Bildschirmfoto 2022-10-13 um 22 10 44](https://user-images.githubusercontent.com/80644370/195699602-08d5ba6c-6aff-4616-b0c8-edb3efc6949a.png)
