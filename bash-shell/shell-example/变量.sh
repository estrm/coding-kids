# 定义变量

#!/bin/bash

# 变量赋值
your_name="sun"
echo $your_name

# read-only
my_string="jiajia"
readonly my_string
echo ${my_string}

# delete variable
unset your_name
echo $your_name

# 字符串
my_name="yiyi"
all_name="${my_string}, ${my_name}"
echo $all_name

# 查找子字符串
echo `expr index "$all_name" yi`;

# shell 数组

######################################
# 字符串截取
var="http://www.frufruread.com/index.html"
echo "字符串截取 $var"

# 1 '#' 截取, 删除左边字符,保留右边字符
echo ${var#*//}

# 2 '##' 截取, 删除左边字符,保留右边字符
echo ${var##*/}

# 3 '%' 删除右边字符,保留左边字符
echo ${var%/*}

# 4 '%%' 删除右边字符,保留左边字符
echo ${var%%/*}

# 从左边第几个字符开始,及字符的个数
echo ${var-0:5}
