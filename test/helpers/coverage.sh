#/bin/bash

file=test/coverage_helper_test.dart
echo "// Helper file to make coverage work for all dart files\n" > $file
echo "// ignore_for_file: unused_import" >> $file
find lib -name '*.dart' | cut -c4- | awk -v package='jokenpo' '{printf "import '\''package:%s%s'\'';\n", package, $1}' >> $file
echo "void main(){}" >> $file

flutter test --coverage 
## rodar o coverage