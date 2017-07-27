# shell 传递参数

#!/bin/bash

echo "shell传递的参数为:"
echo "exe filename $0"
echo "1 $1"
echo "2 $2"
echo "3 $3"

# $*
for i in "$*"; do
	echo $i
done

# $@
for i in "$@"; do
	echo $i
done

####### 参数处理 #########

echo "\$# 参数个数    $#"
echo "\$* 参数字符串  $*"
