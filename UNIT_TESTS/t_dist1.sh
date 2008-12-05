#!/bin/sh

IFS="
"

for line in `cat t_dist1.dat`
do
  edis=`echo $line | awk '{print $1}'`
  str1=`echo $line | awk '{print $2}'`
  str2=`echo $line | awk '{print $3}'`

  dist=`../levenshtein-comp "${str1}" "${str2}"`
  if [ "${dist}" != "${edis}" ]
  then
    echo "fail: expected ${edis} for ${str1} ${str2}, got ${dist}"
    exit 1
  else
    echo "pass: ${dist} ${str1} ${str2}"
  fi
done
