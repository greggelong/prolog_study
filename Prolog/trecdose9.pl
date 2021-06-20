likes(mary,wine).
likes(bob,beer).
likes(wini,apple).
likes(charlie,wine).

likes(john,X):-
    likes(X,wine).

thief(wini).
thief(john).
thief(william).

may_steal(john,X):-
    thief(john),
    likes(john,X).
