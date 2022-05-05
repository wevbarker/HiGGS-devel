#!/bin/bash

while [ $(ls ./emptyd | wc -l) -le 2 ]; do
  echo "lessthan"
done

exit 0
