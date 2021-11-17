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
eval $(minikube docker-env)

minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

sleep 5

docker build -t nginx ./srcs/nginx/
docker build -t mysql ./srcs/mysql/
docker build -t phpmyadmin ./srcs/phpmyadmin/
#docker build -t wordpress ./srcs/wordpress/ > /dev/null
#docker build -t ftps ./srcs/ftps/
#docker build -t grafana ./srcs/ftps/

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/metallb.yaml

kubectl apply -f ./srcs/yalm/metallb_configmap.yalm
kubectl apply -f ./srcs/yalm/nginx.yalm
kubectl apply -f ./srcs/yalm/mysql.yalm
kubectl apply -f ./srcs/yalm/phpmyadmin.yalm
#kubectl apply -f ./srcs/yalm/ftps.yalm
#kubectl apply -f ./srcs/yalm/wordpress.yalm
#kubectl apply -f ./srcs/yalm/grafana.yalm
#minikube dashboard
