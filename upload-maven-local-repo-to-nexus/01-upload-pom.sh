#!/bin/bash

pom_file=$1
base_pom_file="$(basename -- $pom_file)"
ext_pom_file="${pom_file##*.}"

curl -u $3:$4 \
     -s -X POST "$2" \
     -H "accept: application/json" \
     -H "Content-Type: multipart/form-data" \
     -F "maven2.generate-pom=false" \
     -F "maven2.packaging=$base_pom_file" \
     -F "maven2.asset1=@$pom_file" \
     -F "maven2.asset1.extension=$ext_pom_file"

echo "$(date) Uploaded file" >> ./upload.log
echo "$pom_file" >> ./upload.log
