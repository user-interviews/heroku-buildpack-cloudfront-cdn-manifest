#!/usr/bin/env bash

download_file () {
  local remote_path=$1
  local local_path=$2

  curl "https://assets.userinterviews.com/${remote_path}" >> $build_dir/assets-$SOURCE_VERSION/public/$local_path

  local status=$?

  if [[ status -eq 0 ]]; then
    echo "Downloaded remote file to $build_dir/assets-$SOURCE_VERSION/public/$local_path" | indent
  fi

  return $status
}
