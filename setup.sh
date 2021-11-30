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

kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

export EXTERNAL_IP=`minikube ip`

envsubst '${EXTERNAL_IP}' < ./srcs/yaml/configmap/metallb_configmap.yaml > ./srcs/yalm/metallb_configmap.yalm
envsubst '${EXTERNAL_IP}' < ./srcs/yaml/nginx.yaml > ./srcs/yalm/nginx.yaml

#envsubst ${$EXTERNAL_IP} < ./srcs/yaml/mysql.yaml
#envsubst '$EXTERNAL_IP' < ./srcs/yaml/wordpress.yaml
#envsubst '$EXTERNAL_IP' < ./srcs/yaml/phpmyadmin.yaml

docker build -t nginx ./srcs/nginx/ --network=host #> /dev/null
#docker build -t mysql ./srcs/mysql/ --network=host#> /dev/null
#docker build -t phpmyadmin ./srcs/phpmyadmin/ --network=host #> /dev/null
#docker build -t wordpress ./srcs/wordpress/ --network=host #> /dev/null
#docker build -t ftps ./srcs/ftps/
#docker build -t grafana ./srcs/grafana/
#docker build -t influxdb ./srcs/influxdb/

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/yalm/metallb_configmap.yalm
kubectl apply -f ./srcs/yalm/nginx.yalm
#kubectl apply -f ./srcs/yalm/mysql.yalm
#kubectl apply -f ./srcs/yalm/phpmyadmin.yalm
#kubectl apply -f ./srcs/yalm/wordpress.yalm
#kubectl apply -f ./srcs/yalm/ftps.yalm
#kubectl apply -f ./srcs/yalm/grafana.yalm
#kubectl apply -f ./srcs/yalm/influxdb.yalm

minikube dashboard
