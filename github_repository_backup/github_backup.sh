#!/bin/bash
#
# (c) 2021-2022, Sun Yiming <zscandyz@gmail.com>
#
# Description:
#   This is a tool to auto backup all repositories from github.
#
# Version:
#   2019/11/22, v1.0, first release, Sun Yiming

if [[ $# -eq 0 ]] || [[ $1 = "-h" ]];then
	echo -e "\033[31m--------------------------------------------------------\033[0m"
	echo "Usage1: $0 URL"
	echo "   e.g: $0 https://github.com/estrm?tab=repositories"
	echo ""
	echo "Usage2: $0 Username Page"
	echo "   e.g: $0 estrm 1"
	echo -e "\033[31m--------------------------------------------------------\033[0m"
	exit 1;
fi

url=""
username=""
if [ $# == 1 ];then
	url="https://github.com/estrm?tab=repositories"
	username=${url%\?*}
	username=${username##*/}
else
	username=$1
	url="https://github.com/${username}?page=${2}&tab=repositories"
fi

patten1="a href=\"/"${username}"/"
r_path=`curl "${url}" | grep "${patten1}"`

# get repositories url path
path_head="https://github.com/"
for p in ${r_path}
do
	if [[ $p =~ "href" ]];then
		p=${p#*/}
		p=${p%\"*}

		p=${path_head}${p}
		echo -e "\033[33m ====== Download ====================\033[0m"
		echo -e "\033[32m $p \033[0m"
		git clone ${p}
		echo -e "\033[33m ====== $p has been Finished =================\033[0m"
	fi
done
