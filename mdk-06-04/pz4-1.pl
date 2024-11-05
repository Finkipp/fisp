%1
square(X, S) :- S is X * X.
cube(X, C) :- C is X * X * X.

%2
linear_function(A, B, X, Y) :- Y is A*X + B.

%3
triangle_perimeter(SideA, SideB, SideC, P) :- P is SideA + SideB + SideC.

%4
right_triangle_area(Cathet1, Cathet2, Area) :- Area is (Cathet1 * Cathet2) / 2.

%5
trapezoid_area(BaseA, BaseB, Height, Area) :- Area is ((BaseA + BaseB) / 2) * Height.

%6
hypotenuse_square(Cathet1, Cathet2, HypSquare) :- HypSquare is Cathet1^2 + Cathet2^2.

%7
rectangular_prism_volume(SideA, SideB, SideC, Volume) :- Volume is SideA * SideB * SideC.

%8
distance(V, T, D) :- D is V * T.

%9
last_digit(Number, Digit) :- Digit is Number mod 10.

%10
digits_of_two_digit_number(Number, Tens, Ones) :-
    Tens is Number // 10,
    Ones is Number mod 10.

%11
first_digit_of_three_digit_number(Number, Digit) :-
    Digit is Number // 100.

%12
sum_of_digits_of_three_digit_number(Number, Sum) :-
    First is Number // 100,
    Remaining is Number mod 100,
    Second is Remaining // 10,
    Third is Remaining mod 10,
    Sum is First + Second + Third.

/*result
?- square(5, S).
S = 25.

?- cube(3, C).
C = 27.

?- linear_function(2, 3, 4, Y).
Y = 11.

?- triangle_perimeter(3, 4, 5, P).
P = 12.

?- right_triangle_area(3, 4, Area).
Area = 6.

?- trapezoid_area(7, 9, 5, Area).
Area = 40.

?- hypotenuse_square(3, 4, HypSquare).
HypSquare = 25.

?- rectangular_prism_volume(3, 4, 5, Volume).
Volume = 60.

?- distance(50, 2, D).
D = 100.

?- last_digit(12345, Digit).
Digit = 5.

?- digits_of_two_digit_number(35, Tens, Ones).
Tens = 3,
Ones = 5.

?- first_digit_of_three_digit_number(456, Digit).
Digit = 4.

?- sum_of_digits_of_three_digit_number(345, Sum).
Sum = 12.

*/