#!/bin/sh

git clone https://github.com/mees-/journal journal
cd journal
npm install
export POST_DIR=$(pwd)/../entries
npm run build
