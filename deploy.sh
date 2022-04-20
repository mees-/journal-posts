#!/bin/sh

git clone https://github.com/mees-/journal journal
cd journal
npm install
export POST_DIR=$(pwd)/../entries
export SITE_URL="https://journal.mees.io"
npm run build
cd ..
git checkout gh-pages
cp -R journal/public/ .
rm -rf journal
git push origin gh-pages
git checkout master
