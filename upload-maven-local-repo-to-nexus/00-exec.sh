#!/bin/bash
echo "$(date) Start..." > ./upload.log
if [[ -z $1 ]]; then
    read -p 'Nexus API server: ' srv
	echo "$(date) User input server name/ip address for nexus api: $srv" >> ./upload.log
fi
srv=$1
if [[ -z $2 ]]; then
    read -p 'Maven repo name: ' repo
	echo "$(date) User input repo name: $repo" >> ./upload.log
fi
repo=$2
url="http://$srv/service/rest/v1/components?repository=$repo"
if [[ -z $3 ]]; then
    read -p 'Username: ' user
	echo "$(date) User input username: $user" >> ./upload.log
fi
user=$3
if [[ -z $4 ]]; then
    read -sp 'User password: ' paswd
    echo
	echo "$(date) User input password" >> ./upload.log
fi
paswd=$4
if [[ -z $5 ]]; then
    read -p 'Path to local repo for upload: ' path
	echo "$(date) User input path to local repo: $path" >> ./upload.log
fi
path=$5

echo "$(date) Remove garbage files from path $path" >> ./upload.log
find $path -name *.sha1 -type f -exec rm -f {} \;
find $path -name *.repositories -type f -exec rm -f {} \;

for dir in $(find $path -type d); do
    count=$(ls -p $dir | grep -v / | wc -l)
    if [ $count = 1 ]
    then
        filename=$(ls -p $dir | grep -v /)
        ./01-upload-pom.sh "$dir/$filename" $url $user $paswd
        echo "Upload only POM file"
    fi
    if [ $count = 2 ]
    then
        jarfile=$(ls -p $dir | grep -v / | grep ".jar")
        pomfile=$(ls -p $dir | grep -v / | grep ".pom")
        ./02-upload-all.sh "$dir/$jarfile" "$dir/$pomfile" $url $user $paswd
        echo "Upload JAR & POM files"
    fi
done
echo "$(date) Finish" >> ./upload.log