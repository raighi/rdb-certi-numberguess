#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER_TO_GUESS=500 #$(( 1+ $RANDOM %1000 ))

echo Enter your username:
read USERNAME

USER_QUERY=$($PSQL "SELECT username, games_played, best_game 
FROM users 
WHERE username='$USERNAME';")
# Si l'user n'existe pas
if [[ -z $USER_QUERY ]] 
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
CREATE_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', '0')")
else
echo "$USER_QUERY" | while IFS='|' read USERNAME GAMES BEST
do
echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
done
fi

GUESSES=0
echo "Guess the secret number between 1 and 1000:"
GUESSING(){
if [[ $1 ]]
then 
echo "$1"
fi
GUESSES=$(( $GUESSES+1 ))
read GUESS
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
GUESSING "That is not an integer, guess again:"
else
  if (( GUESS < NUMBER_TO_GUESS ))
  then
  GUESSING "It's higher than that, guess again:"
  else
    if (( GUESS > NUMBER_TO_GUESS ))
    then
    GUESSING "It's lower than that, guess again:"
    else
      if (( GUESS = NUMBER_TO_GUESS ))
      then
      echo "You guessed it in $GUESSES tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
      GAMES=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME';")
      GAMES=$(( $GAMES+1 ))
      UPDATE_GAMES_RESULT=$($PSQL "UPDATE users SET games_played='$GAMES' WHERE username='$USERNAME'")
      BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
        if [[ -z $BEST ]]
        then
        UPDATE_BEST_RESULT=$($PSQL "UPDATE users SET best_game='$GUESSES' WHERE username='$USERNAME'")
        else
          if (( GUESSES < BEST ))
          then
          UPDATE_BEST_RESULT=$($PSQL "UPDATE users SET best_game='$GUESSES' WHERE username='$USERNAME'")
          fi
        fi
      fi
    fi
  fi
fi
}
GUESSING
