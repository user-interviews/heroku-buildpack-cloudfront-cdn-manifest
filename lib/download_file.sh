#!/usr/bin/env bash

download_file () {
  local remote_path=$1
  local local_path=$2
  local file_url="https://assets.userinterviews.com/${remote_path}"

  # Verify content type of remote file
  if curl -s -I $file_url | grep -iq "application/zip,application/octet-stream"; then
    # download zip file
    curl $file_url >> $build_dir/public/$local_path
    echo "Downloaded remote zip file to $build_dir/public/$local_path" 

    # unzip file then remove zip
    unzip -q $build_dir/public/$local_path -d $build_dir/public/
    rm $build_dir/public/$local_path

    echo "Unzipped assets into $build_dir/public" 
  else
    # If the zip isn't downloaded & unpacked successfully, rails will attempt to precompile assets instead
    echo "Compressed assets not found in S3!"
    echo "Falling back to rails assets:precompile"
  fi

  return 0
}
