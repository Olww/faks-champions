# faks-champions
This is a simple Ruby program that solves this problem:

you have a list of chess players with their ages and scores (elo).
you have to extract from the list the "champions".
A player is called "champion" if and only if there is nobody else in the list who "eliminates" him, that is to say:
- nobody else is both strictly stronger and younger or the same age
- no one else is both strictly younger and stronger or the same score

## Requirements

 - Ruby (2.4.10 version or later)
 - Rspec (3.12 version or later)
