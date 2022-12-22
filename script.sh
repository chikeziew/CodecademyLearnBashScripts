#!/bin/bash
echo "Congrats on reaching the final step of the build"

firstline=$(head -n1 source/changelog.md)
echo $firstline

#split a string into an array
read -a splitfirstline <<< $firstline

#set the value of the version of the script from the array.
version=${splitfirstline[1]}
echo $version

echo "Continue? Enter '1' for YES and '2' for NO"
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  #access files in a particular directory
  files=source/*
  for filename in $files
  do 
    echo $filename
    if [ $filename == "source/secretinfo.md" ]
    then
      echo "This file will not be copied"
    else
    #list the filename and copy the file to the new directory
      echo "This file will be copied"
      cp $filename build
    fi
  done
else
  echo "Please come back when you are ready"
  exit
fi

#list the files in the build directory
cd build
echo "Current directory is " 
pwd
ls
cd ..