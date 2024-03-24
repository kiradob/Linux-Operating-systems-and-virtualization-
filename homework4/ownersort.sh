#!/bin/bash

# Создание директорий для владельцев
owners=$(ls -l | awk 'NR>1 {print $3}' | sort -u)
for owner in ${owners}; do
    mkdir -p "${owner}"
done

# Копирование файлов в соответствующие директории владельцев
files=$(ls -l | awk 'NR>1 {print $3, $9}')
count=0
for file in ${files}; do
    count=$((count + 1))
    if ((count % 2 == 0)); then
        filename="${file}"
        if [ -f "${filename}" ]; then
            ownerdir=$(echo "${file}" | cut -d' ' -f1)
            cp "${filename}" "${ownerdir}/${filename}"
            echo "Файл ${filename} скопирован в директорию ${ownerdir}"
        fi
    fi
done