

%% recursive collatz 


%% clauses that define even and odd
%% by the remainder of modulo

is_even(X) :- What is X mod 2, 
			What =:= 0, 
			write(X),
			write(' is even'),nl.

is_odd(X) :- What is X mod 2, 
			What =:= 1, 
			write(X),
			write(' is odd'),nl.



%% collatz is defined in 4 clauses 
%% clause zero to catch that entry by user
%% clause 1 to terminate the recursion
%% and an even and odd clause


collatz(0,_):- write('oh look its zero'),nl.
collatz(1,_):- write('you have made it to one!!!!'),nl.

collatz(In,Out):- is_even(In), 
			Out is In / 2,
			write(In), write(' divided by 2 '),write(Out),nl, 
			collatz(Out,_).
			
			
collatz(In,Out):- is_odd(In), 
			Out is In *3 +1, 
			write(In), write(' mult 3 plus 1 '), write(Out),nl, 
			collatz(Out,_).


