% Факты
pretty(mary).
kind(john).
masculine(john).
strong(john).

% Правила
happy(Person) :- likes_women(Person).
likes_women(Person) :- woman_likes(Person, _).
woman_likes(Man, Woman) :- likes_man(Woman, Man), kind(Man); kind(Man), strong(Man).
likes_man(Woman, Man) :- pretty(Woman).

/*result
?- happy(john).
true ;
true.

?- woman_likes(Man, _).
Man = john ;
Man = john.
*/