#!/bin/sh

git clone https://github.com/mees-/journal .journal
cd .journal
npm install
export POST_DIR=$(pwd)/../entries
export SITE_URL="https://journal.mees.io"
npm run build
cd ..
git checkout -f gh-pages
mv CNAME .CNAME
rm -rf ./*
cp -R .journal/public/ .
mv .CNAME CNAME
rm -rf .journal
git add --all
git commit -m "$(git log master -1 --pretty=%B)"
git push origin gh-pages
git checkout master
