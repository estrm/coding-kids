#!/bin/bash
DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		echo $dir
		cd ${dir}
		git pull
		cd ..
	fi
done
