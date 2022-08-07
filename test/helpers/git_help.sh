#/bin/bash

#set -e

#sh test/helpers/coverage.sh jokenpo

git add .
git commit -m "$1"
git push

# powershell
# New-Alias -Name suba -Value '.\test\helpers\git_help.sh'


## code ~/.bashrc to permant use
# alias vai="sh test\helpers\git_help.sh"
# test --coverage