#!/bin/bash

read -p "Введите путь к директории: " DELDIR

if [ -d "${DELDIR}" ]; then
    echo "Директория найдена"
    cd "${DELDIR}" || exit 1
    
    # Удаление файлов с заданными расширениями
    files=$(find . -maxdepth 1 -type f \( -name "*.bak" -o -name "*.tmp" -o -name "*.backup" \))

    if [ -n "${files}" ]; then
        rm -v ${files}
        echo "Файлы успешно удалены"
    else
        echo "Файлов с расширениями .bak, .tmp, .backup не найдено"
    fi
else
    echo "Директория не найдена или указан неверный путь"
    exit 2
fi