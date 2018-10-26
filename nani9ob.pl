:- dynamic here/1.  %% this sets the location facts as dynamic they are not saved
:- dynamic have/1.   %% will be dynamic asserted 
:- dynamic location/2.
:- dynamic location_s/2.
:- dynamic is_on/1.




room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

location(desk, office).
location(apple, kitchen).
location(flashlight, desk).
location('washing machine', cellar).
location(nani, 'washing machine').
location(broccoli, kitchen).
location(crackers, kitchen).
location(computer, office).
location(envelope,desk).
location(stamp,envelope).
location(key,envelope).

location_s(object(candle,red,small,1 ),kitchen).
location_s(object(apple,red,small,1 ),kitchen).
location_s(object(apple,green,small, 1),kitchen).
location_s(object(table,blue,big, 50) ,kitchen).

object(candle,red,small,1 ).
object(apple,red,small,1 ).
object(apple,green,small,1 ).
object(table, blue, big ,50).


door(office, hall).
door(kitchen, office).
door(hall, 'dining room').
door(kitchen, cellar).
door('dining room', kitchen).

edible(apple).
edible(crackers).

taste_yuchy(broccoli).

here(kitchen).
 

where_food(X,Y):- 
	location(X,Y),
	edible(X).
where_food(X,Y):-
	location(X,Y),
	taste_yuchy(X).

connect(X,Y):- door(X,Y).
connect(X,Y):- door(Y,X).

list_things(Place) :-
 	location(X,Place),
	 
	tab(2),
 	write(X),
 	nl,
	 
	fail.   %% this fail is used to force backtracking but we must use 
list_things(_). %% anonymous var clause so when it is called it can succed when called	

list_things_s(Place):-
	write(boop),nl,
	location_s(object(Thing,Color,Size,Weight),Place),
	write('A '),write(Size),tab(1),
	write(Color),tab(1),
	write(Thing), write(', weighing '),
	write(Weight), write(' pounds'), nl,
	fail.
list_things_s(_).	

list_connections(Place):-
	connect(Place,X),
	tab(2),
	write(X),
	nl,
	fail.
list_connections(_).		
		

look :-
	here(Place),
	write('You are in the '), write(Place), nl,
	write('You can see:'),nl,
	list_things(Place),
	list_things_s(Place),
	write('You can go to:'),nl,
	list_connections(Place).


look_in(Thing):-
	list_things(Thing).
	
goto(Place):-         %% page 63
	can_go(Place),
	move(Place),
	look.
	
can_go(Place):-
	here(X),
	connect(X,Place).
can_go(_):-
	write('You can''t get there from here'),nl, %% put two single quotes for contractions
	fail.
	
move(Place):-             
	retract(here(_)),  %% so not to get a singleton v 
	asserta(here(Place)).

take(X):-
	can_take(X),
	take_object(X).	

take_s(X):-
	can_take_s(X),
	write('boop'),
	take_object_s(X).
	
can_take(Thing):-
	here(Place),
%%  location(Thing,Place).
	is_contained_in(Thing,Place).
can_take(Thing):-
	write('There is no '),write(Thing), write(' here.'),
	nl,
	fail.
	
take_object(X):-
	retract(location(X,_)),
	asserta(have(X)),       %% have clause asserted 
	write('Taken!'),nl.

take_object_s(X):-
	object(X,Y,Z,W), %% call object to get values to retract and assert, not local var like python functon
	retract(location_s(object(X,Y,Z,W),_)),
	asserta(have(object(X,Y,Z,W))),       %% have clause asserted 
	write('Taken!'),nl.
	
	
can_take_s(Thing) :-
	here(Room),
	location_s(object(Thing ,_,small,_), Room).
can_take_s(Thing) :-
	here(Room),
	location_s(object(Thing,_,big,_),Room),
    write('The '), write(Thing),
	write(' is too big to carry.'), nl,
	fail.
can_take_s(Thing) :-
	here(Room),
	not(location_s(object(Thing ,_,_,_),Room)),
	write('There is no '), write(Thing),
	write('here.'), nl,
	fail.	

put(X):-
	have(X),
	retract(have(X)),
	here(Place),
	asserta(location(X,Place)),
	write('Put!'),nl.
put(X):-
	write('You don''t have '),
	write(X),nl,
	fail.

put_s(X):-
	have(X),
	%%  dont need a call to object(X,Y,Z,W), to get values as it as asserted
	retract(have(X)),
	here(Place),
	asserta(location_s(X,Place)),
	write('S Put!'),nl.
put_s(X):-
	write('You don''t have '),
	write(X),nl,
	fail.




	
inventory:-
	have(X),
	tab(2),
	write(X),
	nl,
	fail.
inventory.	
	

is_contained_in(T1,T2):- 
	location(T1,T2).

is_contained_in(T1,T2):-        %%  flashite is in office
	location(X,T2),             %% if there is somthing located the office	
	is_contained_in(T1,X).      %% and the flashlight is contained in that thing. recursive
	
turn_on(X):-
	have(X),
	asserta(is_on(X)),
	write(X),
	write(' is turned on'), nl.
turn_on(X):- 
	write('You don''t have '),
	write(X),nl,
	fail.
	
turn_off(X):-
	is_on(X),
	retract(is_on(X)),
	write(X),
	write(' is turned off.'), nl.
turn_off(X):- 
	write(X),
	write(' is not on.'),nl,
	fail.