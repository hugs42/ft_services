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

sleep 2

kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

export EXTERNAL_IP=`minikube ip`

envsubst '$EXTERNAL_IP' < ./srcs/yaml/configmap/metallb_configmap.yaml > ./srcs/yaml/metallb_configmap.yaml
envsubst '$EXTERNAL_IP' < ./srcs/yaml/deploy_and_serv/nginx.yaml > ./srcs/yaml/nginx.yaml

#envsubst ${$EXTERNAL_IP} < ./srcs/yaml/mysql.yaml
#envsubst '$EXTERNAL_IP' < ./srcs/yaml/wordpress.yaml
#envsubst '$EXTERNAL_IP' < ./srcs/yaml/phpmyadmin.yaml

docker build -t nginx ./srcs/nginx/ --network=host #> /dev/null
#docker build -t mysql ./srcs/mysql/ --network=host #> /dev/null
#docker build -t phpmyadmin ./srcs/phpmyadmin/ --network=host #> /dev/null
#docker build -t wordpress ./srcs/wordpress/ --network=host #> /dev/null
#docker build -t ftps ./srcs/ftps/
#docker build -t grafana ./srcs/grafana/
#docker build -t influxdb ./srcs/influxdb/

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/yaml/metallb_configmap.yaml
kubectl apply -f ./srcs/yaml/nginx.yaml
#kubectl apply -f ./srcs/yalm/mysql.yaml
#kubectl apply -f ./srcs/yalm/phpmyadmin.yaml
#kubectl apply -f ./srcs/yalm/wordpress.yaml
#kubectl apply -f ./srcs/yalm/ftps.yaml
#kubectl apply -f ./srcs/yalm/grafana.yaml
#kubectl apply -f ./srcs/yalm/influxdb.yaml

minikube dashboard
