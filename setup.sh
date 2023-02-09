#!/bin/bash
###
# This program clones repositories related to the Holdr
# platform and installs all the dependencies specified
# in the package.json for each of the projects.
###

repos=("https://github.com/devholdrclub/base-web-app.git" "https://github.com/devholdrclub/marketplace-web-app.git" "https://github.com/devholdrclub/holdr-backend.git")
clt_name=""
expected_clt_version=""
recommended_clt_version=""
error_message=""

check_deps () {
  # TODO: add nvm check
  # Check for yarn, node
  node_path=$(which node)
  yarn_path=$(which yarn)

  if [ -z "$node_path" ]
  then
    echo "You need to inst
    all node, using nvm"
    exit
  elif [ -z "$yarn_path" ]
  then
    echo "You need to install yarn."
    exit
  fi
}

check_version () {
  current_version=$($clt_name -v)
  if [[ $current_version < $expected_clt_version ]]
    then
    echo "Install newer version of $clt_name."
    echo "Current version is not recommended. We recommend $recommended_clt_version"
    exit
  fi
}

check_deps_versions () {
  ## Check node versions compatible
  clt_name="node"
  expected_clt_version="v18.14.0"
  recommended_clt_version="v18 LTS"
  check_version

  ## Check node versions compatible
  clt_name="yarn"
  expected_clt_version="1.22.10"
  recommended_clt_version="1.22.10"
  check_version
}

prepare_install () {
  ## check if deps are installed
  check_deps

  ## check if deps are acceptable version
  check_deps_versions
}

install () {
  echo 'installing packages for..'
}

install_all() {
  echo 'install packages for all projects'
}

clone () {
  echo 'Cloning repositories...'
}


clone

## if you want experimental
prepare_install



## install packages for each app
## cd into app
## run `yarn` to install packages
## cd back to platform
