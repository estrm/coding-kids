#!/bin/bash

# awk, expr

a=1
b=2

echo "$a + $b=`expr $a + $b`"
echo "$a - $b=`expr $a - $b`"
echo "$a * $b=`expr $a \* $b`"
echo "$a / $b=`expr $a / $b`"
echo "$a % $b=`expr $a % $b`"

echo "${a=$b}"

echo "$[$a==$b]"
echo "$[$a!=$b]"

if [ $a != $b ]
then
	echo "a != b"
fi

# 布尔运算符
echo "布尔运算符"
bool1=true
bool2=false

if [ $bool1 -o $bool2 ]
then
	echo "$bool1 -o $bool2, true"
fi

if [ $bool1 -a $bool2 ]
then
	echo "$bool1 -a $bool2, true"
fi

# 字符串运算符
echo "字符串运算符"
a=sun
b=jia

if [ $a = $b ]
then
	echo "$a  = $b"
else
	echo "$a != $b"
fi

if [ $a != $b ]
then
	echo "$a != $b"
else
	echo "$a  = $b"
fi

if [ -z $a ]
then
	echo "$a length  = 0"
else
	echo "$a length != 0"
fi

if [ $a ]
then
	echo "$a 不为空"
else
	echo "$a 为空"
fi
