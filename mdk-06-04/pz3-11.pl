% База данных с информацией о возрасте и поле людей
age(boris, 18).
age(andrey, 17).
age(mikhail, 18).
age(anna, 18).
age(yulia, 17).

male(andrey).
male(boris).
male(mikhail).
female(anna).
female(yulia).

% Правило для определения того, кто подлежит призыву
eligible_for_draft(Person) :-
    male(Person),
    age(Person, Age),
    Age >= 18.

% Правило для определения тех, кто не подлежит призыву
not_eligible_for_draft(Person) :-
    \+ eligible_for_draft(Person).

/*result
?- eligible_for_draft(X).
X = boris ;
X = mikhail.

?- eligible_for_draft(anna).
false.
*/