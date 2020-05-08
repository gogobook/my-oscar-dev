#!/bin/bash
# clone odoo
git clone --depth=1 https://github.com/django-oscar/django-oscar.git

mv django-oscar/sandbox ./
mkdir -p sandbox/public/media
# mkdir -p sandbox/public/static
# mv django-oscar/Makefile .
cp --remove-destination django-oscar/src/oscar/static_src/oscar/img/image_not_found.jpg ./sandbox/public/media/
# mv django-oscar/package.json .
# mv django-oscar/gulpfile.js .
mv django-oscar/src/oscar ./sandbox
rm -rf django-oscar

cp Dockerfile ./sandbox
cp requirements.txt ./sandbox
chmod 777 ./sandbox
npm install
npm install tailwindcss postcss-cli autoprefixer @fullhuman/postcss-purgecss
npm run build:gulp

conda activate oscar20
make build_sandbox
# git init -q
docker-compose build sandbox