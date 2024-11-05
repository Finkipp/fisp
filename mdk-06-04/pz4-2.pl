%1
least_of_two(A, B, A) :- A =< B.
least_of_two(A, B, B) :- A > B.

%A
least_of_three(A, B, C, Min) :-
    least_of_two(A, B, MinAB),
    least_of_two(MinAB, C, Min).

%B
least_of_six(A, B, C, D, E, F, Min) :-
    least_of_three(A, B, C, MinABC),
    least_of_three(D, E, F, MinDEF),
    least_of_two(MinABC, MinDEF, Min).

%2
is_right_triangle(A, B, C) :-
    (A * A =:= B * B + C * C; 
     B * B =:= A * A + C * C; 
     C * C =:= A * A + B * B).

%3
is_triangle(A, B, C) :-
    A + B > C,
    A + C > B,
    B + C > A.

%4
absolute_value(X, X) :- X >= 0.
absolute_value(X, Y) :- X < 0, Y is -X.

%5
function(X, Y) :-
    (X < -1 -> Y is X * X;
     X >= -1, X =< 1 -> Y is X + 1;
     X > 1 -> Y is X * X).

/*result
?- least_of_two(3, 5, Min).
Min = 3 ;
false.

?- least_of_three(7, 2, 5, Min).
Min = 2 ;
false.

?- least_of_six(1, 3, 5, 2, 8, 4, Min).
Min = 1 ;
false.

?- is_right_triangle(3, 4, 5).
true.

?- is_triangle(5, 6, 10).
true.

?- absolute_value(-7, Abs).
Abs = 7.

?- function(0, Y).
Y = 1.
*/
