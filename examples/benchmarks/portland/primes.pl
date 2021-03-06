/*  VAX C-Prolog Benchmark Package  */
/*  Copyright 1985 by Tektronix, Inc., and Portland State University  */


/*    The sieve of Erastosthenes.                                        */
/*                                                                       */
/*    Benchmark prolog program which requires the upper limit as a       */
/*    parameter, and will find all prime numbers between 1 and upper     */
/*    bound. Execution time is given in milliseconds.                    */
/*                                                                       */

primes(Limit, Prime_nums) :-
	integer_list(2,Limit,Ints),
	sift(Ints,Prime_nums).

integer_list(Low,High,[Low|Rest]) :-
	Low =< High, !,
	M is Low + 1,
	integer_list(M,High,Rest).

integer_list(_,_,[]).

sift([],[]).

sift([Int|Ints],[Int|Primes]) :-
	remove(Int,Ints,New),
	sift(New,Primes).

remove(Prime,[],[]).

remove(Prime,[Int|Ints],[Int|New_ints]) :-
	\+(0 is Int mod Prime), !,
	remove(Prime,Ints,New_ints).

remove(Prime,[Int|Ints],New_ints) :-
	0 is Int mod Prime, !,
	remove(Prime,Ints,New_ints).

