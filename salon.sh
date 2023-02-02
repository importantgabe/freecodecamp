#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Menu ~~~~~\n"
echo -e "\nWhat service would you like?"

# get available services
SERVICES_OPTIONS=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

MAIN_MENU() {
if [[ $1 ]]
then
  echo -e "\n$1"
fi

echo "$SERVICES_OPTIONS" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done

read SERVICE_ID_SELECTED
SERVICE_VALIDITY=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

#check for valid service
if [[ -z $SERVICE_VALIDITY ]]
then 
  MAIN_MENU "Please choose a valid service"
else
# get customer info
echo -e "\nWhat is your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
# if not already a customer
if [[ -z $CUSTOMER_NAME ]]
then
# get new customer name 
  echo -e "\nWhat is your name?"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
fi
echo -e "\nWhat time would you like?"
read SERVICE_TIME
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_VALIDITY','$SERVICE_TIME')")
fi

SERVICE_RESULT=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_VALIDITY'")
echo -e "\nI have put you down for a$SERVICE_RESULT at $SERVICE_TIME, $CUSTOMER_NAME."
}






MAIN_MENU
