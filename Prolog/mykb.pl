
likes(john, mary).

valuable(gold).

owns(jane,gold).

father(john, mary).

gives(john, book, mary).

is_rich(X):-
	owns(X, Y),
	valuable(Y).

is_rich(X):-
	father(X,_).