#!/bin/bash

mkdir demorepo
git init
git add .
git commit -m "first commit"
git config --global user.email "tkdhanasekar@gmail.com"
git config --global user.name "dhana"
git commit -m "first commit"
git remote add dhana https://github.com/tkdhanasekar/samplerepo
git status
git add first.py
git commit -m "msg" first.py
git pull dhana master
git push dhana master
git log

