#!/bin/bash
repository=$1
branch1=$2
branch2=$3

log_file=file.log
response_file=response.txt

git clone $repository &> $log_file

dir_name=$(cut -d "/" -f5 <<< "$repository")
# remove ".git" from dir_name
dir_name=$(cut -d "." -f1 <<< "$dir_name")

cd $dir_name
git checkout $branch1 &>> "../${log_file}"
git diff --name-only "origin/${branch2}" > "../${response_file}"
cd ..

rm -rf $dir_name
