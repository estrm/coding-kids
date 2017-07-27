#!/bin/bash

a=10
b=10

if test $[a] -eq $[b]
then
	echo "$a = $b"
else
	echo "$a != $b"
fi

result=$[a+b]
echo "result : $result"
