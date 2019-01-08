#!/usr/bin/env bash

# to run: sh artifacts.sh dev-2.1.0 v2.1.0-beta "Auto release 2.1.0"

# define absolute path to polymath-core and polymath-contract-artifacts projects
PATH_CORE="/Users/polymath/polymath-core"
PATH_CONTRACT_ARTIFACTS="/Users/polymath/polymath-contract-artifacts"

# params validation
if [[ -z "$1" ]]; then
  echo "Branch is empty"
  exit 1
fi
if [[ -z "$2" ]]; then
  echo "Tag is empty"
  exit 1
fi
if [[ -z "$3" ]]; then
  echo "Comment commit is empty"
  exit 1
fi

# pull the last commit from polymath-core and compile .sol files into .json abi files
cd $PATH_CORE
git checkout $1 && git pull
rm -rf build/contracts
truffle compile

# clear artifacts folder from polymath-contract-artifacts and copy the new ones from polymath-core
rm -rf $PATH_CONTRACT_ARTIFACTS/artifacts/*
for file in $(<"$PATH_CONTRACT_ARTIFACTS/scripts/contracts.txt");
do cp "build/contracts/$file" "$PATH_CONTRACT_ARTIFACTS/artifacts";
done

# build the new json abi files, push it and tag it to a new version
cd $PATH_CONTRACT_ARTIFACTS
yarn clean && yarn build:ci
git add --all && git commit -m "$3" && git tag -a $2 -m "$3" && git push origin $2