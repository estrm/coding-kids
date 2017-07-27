#!/bin/bash

demo_func() {
	echo "shell function."
}

echo "-------函数开始执行-------"
demo_func
echo "--------函数执行完毕------"

echo "函数返回值"
add_func(){
	read -p "input a: " a
	read -p "input b: " b
	let result=$a+$b
	return $result
}
add_func
echo "两数之和为: $?."

# 函数参数 funciton 
fun_pragm(){
	i=1
	for j in $*
	do
		echo "第 $i 个参数为: $j"
		let "i++"
	done
}

fun_pragm 1 2 3 4 5
