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
minikube start --driver=docker --cpus=3

eval $(minikube docker-env)

minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

sleep 2

kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

export EXTERNAL_IP=`minikube ip`

envsubst '$EXTERNAL_IP' < ./srcs/yaml/configmap/metallb_configmap.yaml > ./srcs/yaml/metallb_configmap.yaml
envsubst '$EXTERNAL_IP' < ./srcs/yaml/deploy_and_serv/nginx.yaml > ./srcs/yaml/nginx.yaml
envsubst '$EXTERNAL_IP' < ./srcs/yaml/deploy_and_serv/mysql.yaml > ./srcs/yaml/mysql.yaml
envsubst '$EXTERNAL_IP' < ./srcs/yaml/deploy_and_serv/phpmyadmin.yaml > ./srcs/yaml/phpmyadmin.yaml
envsubst '$EXTERNAL_IP' < ./srcs/yaml/deploy_and_serv/wordpress.yaml > ./srcs/yaml/wordpress.yaml
envsubst '$EXTERNAL_IP' < ./srcs/yaml/deploy_and_serv/ftps.yaml > ./srcs/yaml/ftps.yaml
envsubst '$EXTERNAL_IP' < ./srcs/yaml/deploy_and_serv/grafana.yaml > ./srcs/yaml/grafana.yaml
envsubst '$EXTERNAL_IP' < ./srcs/yaml/deploy_and_serv/influxdb.yaml > ./srcs/yaml/influxdb.yaml

docker build -t nginx ./srcs/nginx/ --network=host
docker build -t mysql ./srcs/mysql/ --network=host
docker build -t phpmyadmin ./srcs/phpmyadmin/ --network=host
docker build -t wordpress ./srcs/wordpress/ --network=host
docker build -t ftps ./srcs/ftps/ --network=host
docker build -t grafana ./srcs/grafana/ --network=host
docker build -t influxdb ./srcs/influxdb/ --network=host

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/yaml/metallb_configmap.yaml
kubectl apply -f ./srcs/yaml/nginx.yaml
kubectl apply -f ./srcs/yaml/mysql.yaml
kubectl apply -f ./srcs/yaml/phpmyadmin.yaml
kubectl apply -f ./srcs/yaml/wordpress.yaml
kubectl apply -f ./srcs/yaml/ftps.yaml
kubectl apply -f ./srcs/yaml/grafana.yaml
kubectl apply -f ./srcs/yaml/influxdb.yaml

minikube dashboard
