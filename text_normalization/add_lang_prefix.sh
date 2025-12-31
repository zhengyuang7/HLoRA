#!/bin/bash

# 用法: ./add_lang_prefix_by_prefix.sh input.txt output.txt

input_file="$1"
output_file="$2"

if [ ! -f "$input_file" ]; then
  echo "输入文件不存在: $input_file"
  exit 1
fi

# 定义前缀到语言标签的映射（可根据需要扩展）
declare -A lang_map
lang_map["English"]="<en>"
lang_map["French"]="<fr>"
lang_map["German"]="<de>"
lang_map["Italian"]="<it>"
lang_map["Japanese"]="<ja>"
lang_map["Korean"]="<ko>"
lang_map["Portuguese"]="<pt>"
lang_map["Russian"]="<ru>"
lang_map["Spanish"]="<es>"
lang_map["Thai"]="<th>"
lang_map["Vietnamese"]="<vi>"

# 逐行处理
while IFS= read -r line; do
    # 提取第一列的前缀（第一个'-'和第二个'-'之间的字段）
    first_field=$(echo "$line" | awk '{print $1}')
    lang_prefix=$(echo "$first_field" | cut -d'-' -f1)

    lang_tag=${lang_map[$lang_prefix]}

    if [ -z "$lang_tag" ]; then
        echo "警告：未识别的语言前缀 '$lang_prefix'，跳过行：" >&2
        echo "$line" >&2
        continue
    fi

    # 构建新行
    rest=$(echo "$line" | cut -d' ' -f2-)
    echo "$first_field $lang_tag $rest"
done < "$input_file" > "$output_file"

echo "处理完成，输出文件: $output_file"


