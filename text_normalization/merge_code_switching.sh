#!/bin/bash

input_file="text_2"
output_file="text_3"

> "$output_file"  # 清空输出文件

while IFS= read -r line; do
    # 提取第一列和剩余部分
    first_col=$(echo "$line" | awk '{print $1}')
    rest=$(echo "$line" | cut -d' ' -f2-)

    if [[ "$first_col" == Korean* || "$first_col" == Japanese* ]]; then
        # 合并两个字母/数字之间的空格：例如 "y o u t u b e" => "youtube"
        processed=$(echo "$rest" | sed -E ':a; s/([a-zA-Z0-9-])\s+([a-zA-Z0-9-])/\1\2/g; ta')
        echo "$first_col $processed" >> "$output_file"
    else
        echo "$line" >> "$output_file"
    fi
done < "$input_file"
