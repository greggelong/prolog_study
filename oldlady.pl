%% facts and recursive rule about the old lady who
%% swallowed a fly 
%% swallowed(X,horse) is the base or escape clasue for recursion 


catch(spider,fly).
catch(bird,spider).
catch(cat,bird).
catch(dog,cat).
catch(goat,dog).
catch(cow,goat).
catch(horse,cow).



 
		
		

swallowed(X,horse):- write(X), write(' Swallowed a horse! '), nl, 
		write(X), write(' will die of course'),nl.
		
swallowed(X,Y):- catch(Animal,Y), write('then she swallowed a '),write(Animal),nl, 
		write(' to catch a  '),write(Y),nl,swallowed(X,Animal).		