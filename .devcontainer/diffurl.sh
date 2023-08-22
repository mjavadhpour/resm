#!/bin/sh
set -e

# https://github.com/mjavadhpour/resm/compare/
git remote get-url origin | \
  sed 's/git\@github\.com://' | \
  sed 's/\</https:\/\/github\.com\//' | \
  sed 's/\.git//' | \
  sed 's/\>$/\/compare\//'
