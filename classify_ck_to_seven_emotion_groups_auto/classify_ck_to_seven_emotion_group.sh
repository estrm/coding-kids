#!/bin/bash
#
# (c) 2020-2022, Sun Yiming <zscandyz@gmail.com>
#
# Description:
#   This shell script can classify CK+ Facial Database to different Expression sets.
#   This can create a directory tree to save classified image.
#
# Version:
#   2020/3/8, v1.0, first release, Sun Yiming

fun_mkdir_ck(){
	if [ -d "ck" ]
	then
		echo "ck have exists."
	else
		echo "is creating ck tree."
		mkdir ck
	fi

	ck_path=$1"/ck/"
	emotion_folder_list=("1anger" "2contempt" "3disgust" "4fear" "5happy" "6sadness" "7surprise")
	for expression in ${emotion_folder_list[@]}
	do
		echo $expression
		mkdir $ck_path$expression
	done
}

fun_ck_info(){
	ck_info=$1"/ck_info.txt"
	touch $ck_info
	: > $ck_info
}

work_path=$(pwd)

#mkdir ck directory.
fun_mkdir_ck $work_path

#create ck running log file.
fun_ck_info $work_path

#Sum the number of different emotion.
emotion_num=(0 0 0 0 0 0 0 0)

finished=0
for dir in "Emotion_labels/Emotion/*"
do
	for subdir in $dir"/*"
	do
		for file_list in $subdir"/*"
		do
			for file in $file_list
			do
				echo $finished
				#An example about format of variable file:
				#  Emotion_labels/Emotion/S005/001/S005_001_00000011_emotion.txt
				#  The useful string is: [head_string: S005] and [tail_string: 001].
				emotion_label=$(cat $file)
				emotion_label=${emotion_label##*\ }
				head_string=${file#*/}
				head_string=${head_string#*/}
				head_string=${head_string%%/*}
				tail_string=${file%/*}
				tail_string=${tail_string##*/}

				echo  $emotion_label" "$head_string"/"$tail_string >> $ck_info

				src_ck_path=$work_path"/cohn-kanade-images/"$head_string"/"$tail_string"/*"
				dst_ck_path=$work_path"/ck/"
				copy_dir=${head_string}"_"${tail_string}"/"

				case $emotion_label in
					"1.0000000e+00")
					dst_ck_path=${dst_ck_path}"1anger/"${copy_dir}
					let emotion_num[1]=emotion_num[1]+1
					;;
					"2.0000000e+00")
					dst_ck_path=${dst_ck_path}"2contempt/"${copy_dir}
					let emotion_num[2]=emotion_num[2]+1
					;;
					"3.0000000e+00")
					dst_ck_path=${dst_ck_path}"3disgust/"${copy_dir}
					let emotion_num[3]=emotion_num[3]+1
					;;
					"4.0000000e+00")
					dst_ck_path=${dst_ck_path}"4fear/"${copy_dir}
					let emotion_num[4]=emotion_num[4]+1
					;;
					"5.0000000e+00")
					dst_ck_path=${dst_ck_path}"5happy/"${copy_dir}
					let emotion_num[5]=emotion_num[5]+1
					;;
					"6.0000000e+00")
					dst_ck_path=${dst_ck_path}"6sadness/"${copy_dir}
					let emotion_num[6]=emotion_num[6]+1
					;;
					"7.0000000e+00")
					dst_ck_path=${dst_ck_path}"7surprise/"${copy_dir}
					let emotion_num[7]=emotion_num[7]+1
					;;
						*)
					;;
				esac

				mkdir $dst_ck_path
				cp -r $src_ck_path $dst_ck_path

				let finished=finished+1
			done
		done
	done
done

#just sort ck_info
tmp=$work_path"null.tmp"
touch $tmp
sort $ck_info > $tmp
cat $tmp > $ck_info
rm $tmp

#This will output emotion_num to ck_info
echo "////////////////////////////////" >> $ck_info
echo "Sum for different emotion" >> $ck_info
echo "Emotion      Num" >> $ck_info
echo "--------------------------------" >> $ck_info
echo "anger       "${emotion_num[1]} >> $ck_info
echo "contempt    "${emotion_num[2]} >> $ck_info
echo "disgust     "${emotion_num[3]} >> $ck_info
echo "fear        "${emotion_num[4]} >> $ck_info
echo "happy       "${emotion_num[5]} >> $ck_info
echo "sadness     "${emotion_num[6]} >> $ck_info
echo "surprise    "${emotion_num[7]} >> $ck_info
echo "SUM: "$finished >> $ck_info
echo "--------------------------------" >> $ck_info

echo "Successed."