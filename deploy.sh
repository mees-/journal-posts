#!/bin/sh

set -e

export NODE_ENV=production
export POST_DIR=$(pwd)/entries
export SITE_URL="https://journal.mees.io"
source ./.GA_ID

git clone https://github.com/mees-/journal .journal &
cd .journal
git pull origin master
npm install
npm run build
cd ..
git checkout -f gh-pages
mv CNAME .CNAME
rm -rf ./*
cp -R .journal/public/ .
mv .CNAME CNAME
git add --all
git commit -m "$(git log master -1 --pretty=%B)"
git push origin gh-pages
git checkout master
