#!/bin/sh

../levenshtein-comp
code=$?
if [ ${code} -ne 111 ]
then
  echo "fail: expected 111 got ${code}"
fi

../levenshtein-comp a
code=$?
if [ ${code} -ne 111 ]
then
  echo "fail: expected 111 got ${code}"
fi

../levenshtein-comp a a
code=$?
if [ ${code} -ne 0 ]
then
  echo "fail: expected 0 got ${code}"
fi
