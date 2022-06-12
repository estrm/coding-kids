#!/bin/bash
#
# (c) 2021-2022, Sun Yiming <zscandyz@gmail.com>
#
# Description:
#   This script is a tool that it can check
#   code spelling mistakes and typos automatically.
#
# Usage:
#   put the 'spelling.txt' and 'run_spelling_typo_check.sh' under the same directory,
#   and then run 'run_spelling_typo_check.sh'.
#
# Version:
#   2021/03/02, v1.0, first release, Sun Yiming
#   2021/03/17, v2.0, optimize output result, Sun Yiming
#   2022/06/13, v2.0.1, use an arithmetic expansion to increase the variable value by 1
#                       for typo_sum and index, Sun Yiming
#
# Test Datasets:
#   https://github.com/torvalds/linux/blob/master/scripts/spelling.txt

input=spelling.txt
output=result.txt

if [ -f "$output" ]; then
	> $output
else
	touch $output
fi

line_sum=`awk 'END {print NR}' $input`
typo_sum=0
index=0

while read line
do
	echo "[$index/$line_sum] : $line"

	keyword=${line%%|*}
	temp_grep_result=""
	temp_grep_result=$(grep -rsnwi $keyword --exclude $input)

	if [ "$temp_grep_result" != "" ]; then
		echo ">>>>>> $keyword is matched!"

		echo $line [$index/$line_sum] >> $output
		echo "====================" >> $output
		echo $temp_grep_result >> $output
		echo >> $output

		typo_sum=$((typo_sum+1))
	fi

	index=$((index+1))
done < ${input}

echo ""
echo "####################"
echo "typo_sum=$typo_sum"
echo "####################"