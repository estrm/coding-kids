#!/bin/bash
#
# (c) 2021-2022, Sun Yiming <zscandyz@gmail.com>
#
# Description:
#   This script is a tool that it can help to sync the remote newest code to local repos.
#
# Version:
#   2019/11/22, v1.0, first release, Sun Yiming

DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		echo $dir
		cd ${dir}
		git pull
		cd ..
	fi
done
