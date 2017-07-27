#!/bin/bash

# if else
echo "if else"
a=10
b=20
if [ $a == $b ]
then
	echo "a = b"
elif [ $a -gt $b ]
then
	echo "a > b"
elif [ $a -lt $b ]
then
	echo "a < b"
else
	echo "no condition"
fi
echo

# for loop
echo "for"
for i in 1 2 3 3 5
do
	echo "value is : $i"
done

for str in 'you are pig three.'
do
	echo $str
done
echo

# while
echo "while"
int=1
while(( $int<=5 ))
do
	echo $int
	let "int++"
done

# case
echo "case"
echo "输入 1-4之间的数字:"
echo "你输入数字为:"
read inp
case $inp in
1)
	echo "your choice is 1"
	;;
2)
	echo "your choice is 2"
	;;
3)
	echo "your choice is 3"
	;;
4)
	echo "your chioce is 4"
	;;
*)
	echo "$inp no 1-4"
	;;
esac
