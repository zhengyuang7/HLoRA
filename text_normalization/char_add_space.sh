#!/bin/bash

while IFS= read -r line; do
    if [[ $line == Korean* ]]; then
        # 提取第一列（假设为ID）和第二列开始的剩余内容
        first_field=$(echo "$line" | awk '{print $1}')
        rest_fields=$(echo "$line" | cut -d' ' -f2-)
        # 删除第二列及之后的所有空格
        cleaned_rest=$(echo "$rest_fields" | tr -d ' ')
        echo "$first_field $cleaned_rest"
    else
        echo "$line"
    fi
done < "text_0" > "text_1"


while IFS= read -r line; do
  # 判断是否以 "Japanese" 开头
  if [[ "$line" == Japanese* || "$line" == Korean* ]]; then
    # 提取前两列
    first_col=$(echo "$line" | awk '{print $1}')
    second_col=$(echo "$line" | awk '{print $2}')

    # 将第二列按字符拆分并用空格分隔
    split_second_col=$(echo "$second_col" | sed 's/./& /g' | sed 's/ $//')

    # 输出格式化后的结果
    echo "$first_col $split_second_col"
  else
    echo "$line"
  fi
done < "text_1" > "text_2"
