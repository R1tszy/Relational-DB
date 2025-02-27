#!/bin/bash

# Simulate an element database with associative arrays (for demonstration purposes)
declare -A elements

elements[1]="Hydrogen|H|1.008|nonmetal|-259.1|-252.9"
elements[2]="Silicon|Si|28.085|metalloid|1414|3265"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

found=false

for atomic_number in "${!elements[@]}"; do
  IFS='|' read -r name symbol mass type melting_point boiling_point <<< "${elements[$atomic_number]}"

  if [[ $1 == "$atomic_number" || $1 == "$symbol" || $1 == "$name" ]]; then
    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
    found=true
    break
  fi

done

if ! $found; then
  echo "I could not find that element in the database."
fi

# Make the script executable with:
# chmod +x element.sh

# Example usage:
# ./element.sh 1
# ./element.sh H
# ./element.sh Hydrogen
# ./element.sh 2
# ./element.sh Si
# ./element.sh Silicon
