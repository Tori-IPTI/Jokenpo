#/bin/bash

sh test/helpers/coverage.sh jokenpo

git add .
git commit -m "$1"
git push


# Set-Alias -Name suba -Value '.\test\helpers\git_help.sh'