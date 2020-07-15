%Defining possible states of each of the ship space
occupied(t; f).

%Generate all possible grids
{ship(X, Y, D) : occupied(D)} = 1 :- X=1..x, Y=1..y.

%Bound the grid with empty sea
ship(X, Y, f) :- X=0, Y=1..y.
ship(X, Y, f) :- X=x+1, Y=1..y.
ship(X, Y, f) :- X=1..x, Y=0.
ship(X, Y, f) :- X=1..x, Y=y+1.

%Surrounding sea is considered free path
freePath(X, Y) :- X=0, Y=1..y.
freePath(X, Y) :- X=x+1, Y=1..y.
freePath(X, Y) :- X=1..x, Y=0.
freePath(X, Y) :- X=1..x, Y=y+1.

%Generate empty path from the outside sea
freePath(X, Y) :- ship(X, Y, f), freePath(X+1, Y).
freePath(X, Y) :- ship(X, Y, f), freePath(X-1, Y).
freePath(X, Y) :- ship(X, Y, f), freePath(X, Y-1).
freePath(X, Y) :- ship(X, Y, f), freePath(X, Y+1).

%Remove any grid where a ship is not adjacent to a free path
:- ship(X, Y, t), not freePath(X, Y+1),
                  not freePath(X, Y-1),
                  not freePath(X-1, Y),
                  not freePath(X+1, Y).

%Maximize the number of ships by minimizing empty space
#maximize{1, X, Y : ship(X, Y, t)}.
#show ship/3.
