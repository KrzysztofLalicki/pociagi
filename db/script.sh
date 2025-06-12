#!/bin/bash

rm ./create.sql
for file in $(ls ./create | sort); do
      echo "-- $(basename "$file")" >> ./create.sql
      cat ./create/"$file" >> ./create.sql
      echo "" >> ./create.sql
done

rm ./clear.sql
for file in $(ls ./clear | sort); do
      echo "-- $(basename "$file")" >> ./clear.sql
      cat ./clear/"$file" >> ./clear.sql
      echo "" >> ./clear.sql
done