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

echo "Starting minikube's configuration"
minikube stop
minikube delete
minikube start --driver=docker --cpus=2

minikube addons enable metrics-server > /dev/null
minikube addons enable dashboard > /dev/null
minikube addons enable metallb
eval $(minikube docker-env)
docker build -t nginx ./srcs/nginx/ 
docker build -t phpmyadmin ./srcs/phpmyadmin/ 
docker build -t mysql ./srcs/mysql/ 
docker build -t ftps ./srcs/ftps/

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/metallb.yaml
kubectl apply -f ./srcs/yalm/nginx.yalm
kubectl apply -f ./srcs/yalm/ftps.yalm

minikube dashboard
