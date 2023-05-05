#!/usr/bin/env bash

download_file () {
  local remote_path=$1
  local local_path=$2
  local file_url="https://assets.userinterviews.com/${remote_path}"

  if curl -s -I $file_url | grep -iq "application/json"; then
    curl $file_url >> $build_dir/public/$local_path

    local result=$?

    echo "Downloaded remote file to $build_dir/public/$local_path" | indent

    return 0
  else
    echo "Invalid content type for manifest" | indent
    return 1
  fi
}
