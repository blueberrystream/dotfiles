#!/bin/bash

# search git config file
config=$2
if [ -z "$config" ]; then
  config=".git/config"
fi
if [ ! -e "$config" ]; then
  echo "error: please run at root of git repository."
  exit 1
fi

backup_config="$config.bak"
if [ -e "$backup_config" ]; then
  echo "error: ${backup_config} is existed."
  exit 1
fi

replacement="__alias__"
email="kid0725${replacement}@gmail.com"
if [ -n "$1" ]; then
  email=`echo ${email/${replacement}/+$1}`
else
  email=`echo ${email/${replacement}/}`
fi

# backup config file
mv "$config" "$backup_config"

# put user section
echo "[user]" >> "$config"
echo -e "\tname = \"KID the Euforia\"" >> "$config"
echo -e "\temail = $email" >> "$config"

# put original contents
cat "$backup_config" >> "$config"

# show new git config
echo -n "see new git config file? [y/N]: "
read yn
case "$yn" in
  y | yes ) cat "$config" ;;
esac

# remove backup file
echo -n "remove $backup_config? [y/N]: "
read yn
case "$yn" in
  y | yes ) rm -f "$backup_config" ;;
  * )
    echo -n "restore $config from $backup_config? [y/N]: " ;
    read yn ;
    case "$yn" in
      y | yes )
        rm -f "$config" ;
        mv "$backup_config" "$config" ;;
    esac ;;
esac
