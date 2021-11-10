#!/bin/sh

banner ()
{
	echo "\033[96m"
	echo "                            :::      ::::::::"
	echo "                          :+:      :+:    :+:"
	echo "    42_cursus:          +:+ +:+         +:+"
	echo "    FT_SERVICES       +#+  +:+       +#+"
	echo "                    +#+#+#+#+#+   +#+"
	echo "                          #+#    #+#"
	echo "                         ###   ########.fr\033[0m"
	echo "\033[0m"
}

minikube ()
{
	echo "Starting minikube's configuration"
	minikube delete
}

main ()
{
	banner

}

main
