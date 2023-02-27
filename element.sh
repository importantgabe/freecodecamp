#!/bin/bash

#Script to lookup periodic table elements by atomic number, atomic symbol, or full element name

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#SELECTION_INTERFACE will serve like a main menu
ARGUMENT1="$1"
arg_len=${#ARGUMENT1}
#ATOMIC_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = $ARGUMENT1 ")
#ATOMIC_NAME=$($PSQL "SELECT name FROM elements")

SELECTION_INTERFACE() {
  if [[ -z $ARGUMENT1 ]]
  then 
    echo "Please provide an element as an argument."
  else
  if  [[ $ARGUMENT1 =~ [0-9]+$ ]]
  then
    ATOMIC_NUM_CHECKER
  else
  if [[ $arg_len > 2 ]]
  then 
    ATOMIC_NAME_CHECKER
  else 
    ATOMIC_SYMBOL_CHECKER
  fi
  fi
  fi
}

ATOMIC_NUM_CHECKER(){
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $ARGUMENT1 ")
  if [[ $ATOMIC_NUMBER ]] 
  then
   ATOMIC_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ARGUMENT1")
   ATOMIC_NAME=$($PSQL "SELECT name from elements WHERE atomic_number=$ARGUMENT1")
  ATOMIC_TYPE=$($PSQL "SELECT properties.type_name FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_MASS=$($PSQL "SELECT properties.atomic_mass FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_MELTING_POINT=$($PSQL "SELECT properties.melting_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_BOILING_POINT=$($PSQL "SELECT properties.boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($ATOMIC_SYMBOL). It's a $ATOMIC_TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $ATOMIC_MELTING_POINT celsius and a boiling point of $ATOMIC_BOILING_POINT celsius."
  else 
  echo "I could not find that element in the database."
  fi
}

ATOMIC_SYMBOL_CHECKER(){
  ATOMIC_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$ARGUMENT1'")
  if [[ $ATOMIC_SYMBOL ]]
  then
  ATOMIC_NAME=$($PSQL "SELECT name FROM elements WHERE symbol ='$ARGUMENT1'")
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol= '$ARGUMENT1'")
  ATOMIC_TYPE=$($PSQL "SELECT properties.type_name FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_MASS=$($PSQL "SELECT properties.atomic_mass FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_MELTING_POINT=$($PSQL "SELECT properties.melting_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_BOILING_POINT=$($PSQL "SELECT properties.boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($ATOMIC_SYMBOL). It's a $ATOMIC_TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $ATOMIC_MELTING_POINT celsius and a boiling point of $ATOMIC_BOILING_POINT celsius."
  else
  echo "I could not find that element in the database."
  fi
  

}

ATOMIC_NAME_CHECKER(){
  ATOMIC_NAME=$($PSQL "SELECT name FROM elements WHERE name ='$ARGUMENT1'")
  if [[ $ATOMIC_NAME ]]
  then
  ATOMIC_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$ARGUMENT1'")
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name= '$ARGUMENT1' ")
  ATOMIC_TYPE=$($PSQL "SELECT properties.type_name FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_MASS=$($PSQL "SELECT properties.atomic_mass FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_MELTING_POINT=$($PSQL "SELECT properties.melting_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  ATOMIC_BOILING_POINT=$($PSQL "SELECT properties.boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number='$ATOMIC_NUMBER'")
  echo "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($ATOMIC_SYMBOL). It's a $ATOMIC_TYPE, with a mass of $ATOMIC_MASS amu. $ATOMIC_NAME has a melting point of $ATOMIC_MELTING_POINT celsius and a boiling point of $ATOMIC_BOILING_POINT celsius."
  else
  echo "I could not find that element in the database."
  fi
}

SELECTION_INTERFACE
