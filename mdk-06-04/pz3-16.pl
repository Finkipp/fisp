% Факты
likes(birds, worms).
likes(cats, fish).
my_cat_is_my_friend.
eats_all_it_likes(my_cat).

% Правила
eats(X, Y) :- likes(X, Y), eats_all_it_likes(X).

% Запросы
what_does_my_cat_eat(X) :-
    X = fish.

/*result
?- what_does_my_cat_eat(X).
X = fish.
*/