#!/usr/bin/env bash

# sh artifacts.sh dev-2.1.0 v2.1.0-beta-2 "Auto release"

PATH_CORE="/Users/polymath/polymath-core"
PATH_CONTRACT_ARTIFACTS="/Users/polymath/polymath-contract-artifacts"

if [[ -z "$1" ]]; then
  echo "Branch is empty"
  exit 1
fi
cd $PATH_CORE
git checkout $1 && git pull
rm -rf build/contracts
truffle compile
rm -rf $PATH_CONTRACT_ARTIFACTS/artifacts/*
for file in $(<"$PATH_CONTRACT_ARTIFACTS/scripts/contracts.txt");
do cp "build/contracts/$file" "$PATH_CONTRACT_ARTIFACTS/artifacts";
done
cd $PATH_CONTRACT_ARTIFACTS
yarn clean && yarn build:ci
git add --all && git commit -m "$3" && git tag -a $2 -m "$3" && git push origin $2