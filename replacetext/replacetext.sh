#!/bin/zsh

# Usage:
# Replace all files in directory
# ./replacetext.sh 'https:\/\/localhost' 'https:\/\/myhost' sample/
# Replace one file
# ./replacetext.sh 'https:\/\/localhost' 'https:\/\/myhost' sample/sample1.html

OLD=$1
NEW=$2
TARGET=$3

replace() {
  sed -i '' "s/$1/$2/g" $3
}

if [[ -f $TARGET ]]; then
  replace $OLD $NEW $TARGET
elif [[ -d $TARGET ]]; then
  for f in $TARGET/*; do 
    replace $OLD $NEW $f
  done
fi
