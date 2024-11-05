% Определение пола
male(petr).
male(viktor).
male(andrey).

female(ekaterina).
female(julia).
female(maria).
female(anna).

% Родственные связи
mother(ekaterina, julia).
mother(ekaterina, maria).
mother(anna, ekaterina).
father(petr, julia).
father(viktor, petr).
father(andrey, ekaterina).

% Правила для определения родственных связей

% Дед
grandfather(X, Y) :- father(X, Z), parent(Z, Y).

% Бабушка
grandmother(X, Y) :- mother(X, Z), parent(Z, Y).

% Внук
grandson(Y, X) :- grandfather(X, Y), male(Y).

% Внучка
granddaughter(Y, X) :- grandmother(X, Y), female(Y).

% Тетя
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
sister(X, Y) :- mother(M, X), mother(M, Y), female(X), X \= Y.

% Дядя
uncle(X, Y) :- brother(X, Z), parent(Z, Y).
brother(X, Y) :- father(F, X), father(F, Y), male(X), X \= Y.

% Обобщенное правило для родителя
parent(X, Y) :- mother(X, Y); father(X, Y).

/*result
?- mother(ekaterina, Child), father(petr, Child).
Child = julia ;
false.

?- grandfather(X, julia).
X = viktor ;
X = andrey ;
false.

?- grandmother(X, julia).
X = anna ;
false.
*/