%Defining possible states of each of the ship space
direction(u; d; r; l; e).

%Generate all possible grids
{ship(X, Y, D) : direction(D)} = 1 :- X=1..x, Y=1..y.

%Bound the grid with empty sea
ship(X, Y, e) :- X=0, Y=1..y.
ship(X, Y, e) :- X=x+1, Y=1..y.
ship(X, Y, e) :- X=1..x, Y=0.
ship(X, Y, e) :- X=1..x, Y=y+1.

%Surrounding sea is considered free path
freePath(X, Y) :- X=0, Y=1..y.
freePath(X, Y) :- X=x+1, Y=1..y.
freePath(X, Y) :- X=1..x, Y=0.
freePath(X, Y) :- X=1..x, Y=y+1.

%Generate empty path from the outside sea
freePath(X, Y) :- ship(X, Y, e), freePath(X+1, Y).
freePath(X, Y) :- ship(X, Y, e), freePath(X-1, Y).
freePath(X, Y) :- ship(X, Y, e), freePath(X, Y-1).
freePath(X, Y) :- ship(X, Y, e), freePath(X, Y+1).

%Remove any grid where a ship is pointing to a non-empty space
:- ship(X, Y, u), not ship(X, Y+1, e).
:- ship(X, Y, d), not ship(X, Y-1, e).
:- ship(X, Y, l), not ship(X-1, Y, e).
:- ship(X, Y, r), not ship(X+1, Y, e).

%Remove any grid where a ship is not pointing to a free path
:- ship(X, Y, u), not freePath(X, Y+1).
:- ship(X, Y, d), not freePath(X, Y-1).
:- ship(X, Y, l), not freePath(X-1, Y).
:- ship(X, Y, r), not freePath(X+1, Y).

%Counting atom
shipCount(X, Y, u) :- ship(X, Y, u).
shipCount(X, Y, d) :- ship(X, Y, d).
shipCount(X, Y, l) :- ship(X, Y, l).
shipCount(X, Y, r) :- ship(X, Y, r).
%Maximize the number of ships by minimizing empty space
#maximize{1, X, Y : shipCount(X, Y, D)}.
#show shipCount/3.
