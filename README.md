# prolog_study
some prolog study programs


## some prolog books I am reading
- Adventure in Prolog, Dennis merritt
- Logic programing with Prolog, Bramer M.
- Clause and Effect, Clocksin
- Learn Prolog Now! SWI prolog

## using SWI prolog on Linux and Windows
## x-prolog on android

Wow havent been here in a while. 

for some  reason I am interested in GOFAI again

going through Learn Prolog now Again from the start

using both SWI prolog and GNU prolog.  

there are some differences with the way they treat output.

but overall I really love coding even simple knowledge bases in Prolog

The Prolog interpreter responds to your queries about the facts and rules you put in.

While making a query you are asking Prolog whether it can prove that your query is true.

It really feels conversational and makes you think about the data in a different way.

as an example the exercises for chapter 2 you can solve neet problems with just a bit 

of prolog syntax.  Just with logic and unification of variables.

http://www.let.rug.nl/bos/lpn//lpnpage.php?pagetype=html&pageid=lpn-htmlse7

```prolog

word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e). 

crossword(V1,V2,V3,H1,H2,H3):-
      word(V1, _,A,_,B,_,C,_),
      word(V2, _,D,_,E,_,F,_),
      word(V3, _,H,_,I,_,J,_),
      word(H1, _,A,_,D,_,H,_),
      word(H2, _,B,_,E,_,I,_),
      word(H3, _,C,_,F,_,J,_).

```

or this silly sentence maker.  I added a question clause.

``` prolog
word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun,'big kahuna burger').
word(noun, hedgehog).
word(verb,eats).
word(verb,likes).
word(inter,who).
word(inter,what).
word(inter,when).
word(be, is).


question(Word1,Word2,Word3,Word4):-
		word(inter, Word1),
		word(be, Word2),
		word(determiner, Word3),
		word(noun, Word4),
		write(Word1), write(" "),
		write(Word2), write(" "),
		write(Word3), write(" "),
		write(Word4), write(" ").


sentence(Word1,Word2,Word3,Word4,Word5):-
		word(determiner,Word1),
		word(noun,Word2),
		word(verb,Word3),
		word(determiner,Word4),
		word(noun,Word5),
		write(Word1), write(" "),
		write(Word2), write(" "),
		write(Word3), write(" "),
		write(Word4), write(" "),
		write(Word5).




```
