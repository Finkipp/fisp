works(maria, day).
works(sergey, evening).
works(boris, evening).
works(valentina, evening).

knows(X, Y) :- works(X, Shift), works(Y, Shift), X \= Y.

/*
result
Welcome to SWI-Prolog (threaded, 64 bits, version 9.3.13) SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software. Please run ?- license. for legal details.  For online help and background, visit https://www.swi-prolog.org For built-in help, use ?- help(Topic). or ?- apropos(Word).   % /home/filipp/Documents/pz-3-8.pl compiled 0.00 sec, 5 clauses ?- knows(sergey, boris). true.  ?- knows(valentina, X). X = sergey ; X = boris ; false.  ?- knows(maria, X). false.
*/