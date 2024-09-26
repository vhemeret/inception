# 🐳 Inception

## 📖 About

Inception is a System Administration project focused on using Docker to set up a small infrastructure composed of different services. The entire project is to be done in a virtual machine.

## 🎯 Objectives

- Set up a mini-infrastructure of different services using specific rules
- Use Docker and docker-compose
- Configure each service in its own dedicated container
- Implement data persistence using volumes
- Secure the infrastructure with SSL/TLS

## 🛠️ Services

- NGINX with TLSv1.2 or TLSv1.3
- WordPress + php-fpm
- MariaDB
- Docker volumes for WordPress database and files
- Docker network to connect the containers

## 🚀 Usage

To set up the entire infrastructure:

```
make
```

## ⚙️ Configuration

- Domain name: `<login>.42.fr` (pointing to your local IP address)
- NGINX accessible only through port 443 (HTTPS)
- Two WordPress users (including one admin)
- Volumes stored in `/home/login/data` on the host machine

## 📁 Project Structure

```
.
├── Makefile
├── srcs
│   ├── docker-compose.yml
│   ├── .env
│   └── requirements
│       ├── mariadb
│       │   ├── conf
│       │   ├── Dockerfile
│       │   └── tools
│       ├── nginx
│       │   ├── conf
│       │   ├── Dockerfile
│       │   └── tools
│       └── wordpress
│           ├── conf
│           ├── Dockerfile
│           └── tools
└── secrets
    ├── credentials.txt
    ├── db_password.txt
    └── db_root_password.txt
```

## 🧰 Technologies

- Docker
- docker-compose
- NGINX
- WordPress
- PHP-FPM
- MariaDB
- Alpine Linux or Debian (penultimate stable version)

---

Made with ❤️ as part of the 42 School curriculum.