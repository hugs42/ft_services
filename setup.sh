#!/bin/sh


echo "\033[96m"
echo "                            :::      ::::::::"
echo "                          :+:      :+:    :+:"
echo "    42_cursus:          +:+ +:+         +:+"
echo "    FT_SERVICES       +#+  +:+       +#+"
echo "                    +#+#+#+#+#+   +#+"
echo "                          #+#    #+#"
echo "                         ###   ########.fr\033[0m"
echo "\033[0m"
sleep(5)

echo "Starting minikube's configuration"
minikube delete
killall -TERM kubectl minikube VboxHeadless
minikube start --driver=docker --cpus=2
eval $(minikube docker-env)
minikube addons enable metrics-server > /dev/null
minikube addons enable dashboard &> /dev/null
minikube addons enable metallb
docker build -t nginx ./srcs/nginx/ > /dev/null
docker build -t phpmyadmin ./srcs/phpmyadmin/ > /dev/null
docker build -t wordpress ./srcs/wordpress/ > /dev/null
docker build -t ftps ./srcs/ftps/ > /dev/null
