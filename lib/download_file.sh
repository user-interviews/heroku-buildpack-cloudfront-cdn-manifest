#!/usr/bin/env bash

download_file () {
  local remote_path=$1
  local local_path=$2
  local file_url="https://assets.userinterviews.com/${remote_path}"

  curl $file_url >> $build_dir/public/$local_path

  echo "Downloaded remote file to $build_dir/public/$local_path" 

  unzip -q $build_dir/public/$local_path -d $build_dir/public/
  rm $build_dir/public/$local_path

  echo "Unzipped assets to $build_dir/public" 

  local result=$?

  return 0
}
