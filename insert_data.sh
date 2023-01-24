#! /bin/bash

#Script to insert data from games.csv into World Cup database
if [[ $1 == "test" ]]
then 
 PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
 PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games,teams")

#INSERT TEAMS
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
 TEAM_ID=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
 if [[ $WINNER != "winner" ]]
 then 
  if [[ -z $TEAM_ID ]]
  then
   INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
   if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
   then 
    echo Inserted into teams, $WINNER
   fi
  fi
 fi

  TEAM_ID2=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
 if [[ $OPPONENT != "opponent" ]]
 then 
  if [[ -z $TEAM_ID2 ]]
  then
   INSERT_TEAM_RESULT2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
   if [[ $INSERT_TEAM_RESULT2 == "INSERT 0 1" ]]
   then 
    echo Inserted into teams, $OPPONENT
   fi
  fi
 fi
  
 WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
 OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
 if [[ $YEAR != 'year' ]]
 then
 INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', '$WINNER_ID', '$OPPONENT_ID', $WINNER_GOALS, $OPPONENT_GOALS)")
 echo Inserted $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
 fi
done
