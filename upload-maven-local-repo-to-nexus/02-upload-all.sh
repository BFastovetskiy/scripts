#!/bin/bash

jar_file=$1
pom_file=$2
base_jar_file="$(basename -- $jar_file)"
ext_jar_file="${jar_file##*.}"
ext_pom_file="${pom_file##*.}"

curl -u $3:$4 \
     -s -X POST "$2" \
     -H "accept: application/json" \
     -H "Content-Type: multipart/form-data" \
     -F "maven2.generate-pom=false" \
     -F "maven2.packaging=$base_jar_file" \
     -F "maven2.asset1=@$jar_file" \
     -F "maven2.asset1.extension=$ext_jar_file" \
     -F "maven2.asset2=@$pom_file" \
     -F "maven2.asset2.extension=$ext_pom_file"

echo "$(date) Uploaded files" >> ./upload.log
echo "$jar_file" >> ./upload.log
echo "$pom_file" >> ./upload.log
