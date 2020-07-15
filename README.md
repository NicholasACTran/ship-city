# Ship City Optimization in Clingo/ASP
## Problem Statement
Problem that was posed [here](https://veniamin-ilmer.github.io/ship-city).
It can be restated as "Within a n x m grid, what is the maximum number of filled spaces, such that each space is touching an unbroken sequence of empty spaces that lead to the boundary?"
## Implementation
This solution was developed in Answer Set Programming, using the generate, define, and test methodology.
### Generate
Here, we use the choice rule:
`{ship(X, Y, D) : direction(D)} = 1 :- X=1..x, Y=1..y.`
To generate all possible grids.
### Define
We define the atom freePath/2 in a recursive manner in order to generate which spaces are part of an unbroken sequence of empty spaces to the boundary.
### Test
We use two forms of pruning:
1. Remove any grids where a ship is pointing to another ship.
2. Remove any grids where a ship is not pointing to a free path.
## Run
Assume clingo is the alias to the local clingo instance.
Run in your command line:
`clingo ship-sequences.lp -c x=3 -c y=3`
Where x and y are the dimensions of the grid.
## Results
Given a n x n grid, the maximum has been found for the first 7 integers:
| Integer | Maximum Number of Ships |
|---------|------------------------:|
| 1       |                       1 |
| 2       |                       4 |
| 3       |                      13 |
| 4       |                      21 |
| 5       |                      28 |
| 6       |                      37 |
| 7       |                      50 |
