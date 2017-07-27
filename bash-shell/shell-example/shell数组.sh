#!/bin/bash

arr=(a b c d)
echo "数组元素: ${arr[*]}"
for i in ${arr[*]}; do
	echo $i
done
