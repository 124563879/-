#!/bin/bash

# Параметры
REPO_URL="https://github.com/124563879/-.git"
ZIP_URL="https://chat.openai.com/mnt/data/my-premium-site.zip"
REPO_NAME="premium-site-temp"

# Клонируем репозиторий
git clone "$REPO_URL" "$REPO_NAME"
cd "$REPO_NAME"

# Скачиваем ZIP
curl -L "$ZIP_URL" -o site.zip

# Распаковываем
unzip -o site.zip -d extracted

# Копируем всё внутрь репозитория
cp -r extracted/* .

# Удаляем мусор
rm -rf extracted site.zip

# Коммит и пуш
git add .
git commit -m "Автоматическая загрузка полной версии сайта"
git push origin main
