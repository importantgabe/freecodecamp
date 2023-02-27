#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

MAIN_MENU(){
#generate the number
NUMBER=$(( RANDOM % 1000 + 1 ))
echo $NUMBER
#ask the username
echo "Enter your username:"
read USERNAME
#check if the username exists, 
USERNAME_CHECK
echo "Guess the secret number between 1 and 1000:"
#check if the guess is a number or guess again
NUMBER_GUESS_INTAKE
UPDATE_DATABASE
echo "You guessed it in $NUM_GUESSES tries. The secret number was $NUMBER. Nice job!"
}

USERNAME_CHECK(){
#check if the username exists, welcome if it does 
KNOWN_USER=$($PSQL "SELECT username FROM users WHERE username ='$USERNAME'")
#If they are a known user, welcome them and present stats
if [[ $KNOWN_USER ]]
then
  KNOWN_GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$KNOWN_USER'")
  KNOWN_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$KNOWN_USER'")
  echo "Welcome back, $KNOWN_USER! You have played $KNOWN_GAMES_PLAYED games, and your best game took $KNOWN_BEST_GAME guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

}

NUMBER_GUESS_INTAKE(){
read GUESSED_NUMBER
NUM_GUESSES=$((NUM_GUESSES+1))
NUMBER_CHECKER
}

NUMBER_CHECKER(){
while [ $GUESSED_NUMBER != $NUMBER ]
do
#check if guessed number is an integer
re='^[0-9]+$'
if ! [[ $GUESSED_NUMBER =~ $re ]]
then 
echo "That is not an integer, guess again:"
NUMBER_GUESS_INTAKE
elif [[ $GUESSED_NUMBER > $NUMBER ]]
then
echo "It's lower than that, guess again:"
NUMBER_GUESS_INTAKE
else
echo "It's higher than that, guess again:"
NUMBER_GUESS_INTAKE
fi

done



}

UPDATE_DATABASE(){
if [[ $KNOWN_USER ]] || [[ $NUM_GUESSES < $KNOWN_BEST_GAME ]]
then
KNOWN_GAMES_PLAYED=$((KNOWN_GAMES_PLAYED+1))
KNOWN_GAMES_PLAYED_ENTRY=$($PSQL "UPDATE users SET games_played = $KNOWN_GAMES_PLAYED WHERE username = '$KNOWN_USER'")
BEST_GAME_UPDATE=$($PSQL "UPDATE users SET best_game = $NUM_GUESSES WHERE username = '$KNOWN_USER'")
elif [[ $KNOWN_USER ]]
then
KNOWN_GAMES_PLAYED=$((KNOWN_GAMES_PLAYED+1))
KNOWN_GAMES_PLAYED_ENTRY=$($PSQL "UPDATE users SET games_played = $KNOWN_GAMES_PLAYED WHERE username = '$KNOWN_USER'")
else
NEW_USER_ENTRY=$($PSQL "INSERT INTO users(username,games_played,best_game) VALUES('$USERNAME',1,$NUM_GUESSES)")
fi


}








MAIN_MENU
