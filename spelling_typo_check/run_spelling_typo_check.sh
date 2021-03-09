#!/bin/bash
# run_spelling_typo_check.sh
# test datasets:
#   https://github.com/torvalds/linux/blob/master/scripts/spelling.txt

input=spelling.txt
output=result.txt

if [ -f "$output" ]; then
	> $output
else
	touch $output
fi

line_sum=`awk 'END {print NR}' $input`
index=1
cat $input | while read line
do
	echo "[$index/$line_sum] : $line"

	echo $line [$index/$line_sum] >> $output
	echo "====================" >> $output

	keyword=${line%%|*}
	grep -rsnwi $keyword --exclude $input >> $output
	echo >> $output

	((index++))
done
