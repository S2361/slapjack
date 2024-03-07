# Slapjack 🃏
Slapjack game between the user (player) and machine where players try to slap Jack cards to gain cards.

<p align="center">
  <img width="460" src="https://github.com/S2361/slapjack/assets/68034141/f73c556f-1d9f-4381-b446-0c52b76e8153">
</p>


## Table of Contents 🎴
- [Game Rules](#game-rules)
- [How App Works](#how-app-works)
- [App Creation](#app-creation)
- [Tools](#tools)
- [Creators](#creators)

## Game Rules
Slapjack contains the following rules:
* Player must be the first to slap (click on screen) the middle pile to add the cards to their pile
* Cards earned through slapping a Jack first are added to the pile then shuffled before another card is played
* If the middle pile is slapped by a player without a Jack present, a card is burned from the pile (added to the bottom of the middle pile)
* A player wins when the other players' pile is empty
* A draw occurs when both players have empty piles (game is reset)

## How App Works
### User Interface
#### Player Info
<p align="center">
  <img width="300" src="https://github.com/S2361/slapjack/assets/68034141/95e64bb5-b15b-4f3a-a837-6fdb3abf108a">
  <img width="300" src="https://github.com/S2361/slapjack/assets/68034141/a52e3907-6d0e-4f18-ac1d-21e54bd72850">
</p>

* Player (user) sees their pile of cards near the bottom of the screen
* Machine's cards are near the top of the screen
* Each player area on the UI contains the following information/visuals:
  * Player Name
  * Pile of cards (face-down)
  * Card count of pile
 
#### Middle Pile
<p align="center">
  <img width="400" src="https://github.com/S2361/slapjack/assets/68034141/99229e79-6371-4806-9df1-26193e10e545">
</p>

* Middle Pile contains the played cards in a pile
* The number of cards is displayed under the face-up cards
* On the side of the pile is text that gives a brief description about what move has played (or is in progress)


### Functionality
* Player must tap their face-down deck when it is their turn (cannot play when Machine turn)
* When a card is played, the card count of the player and the pile count is updated
* If a Jack appears, then the player must tap the middle pile within a randomly generated time otherwise middle pile goes to machine
  * Time is between 100 milliseconds to 2 seconds
  * Middle pile is cleared after it goes to one of the players
* If the player taps the middle pile when there is no Jack or after the machine "clicks" the middle pile, then they must burn a card (goes to the bottom of the pile)

## App Creation


## Tools
* Swift


## Creators
@S2361



