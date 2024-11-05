% Типы животных
cat(muska).
cat(strelka).
cat(murka).
dog(reks).
dog(druzhok).
dog(muhtar).

% Цвета животных
color(muska, brown).
color(strelka, black).
color(murka, red).
color(druzhok, red).
color(muhtar, white).
color(reks, spotted).

% Владельцы
owner(anatoly, Animal) :- (cat(Animal), color(Animal, black)); (cat(Animal), color(Animal, brown)).
owner(nickolay, Animal) :- dog(Animal), color(Animal, Color), Color \= white, \+ owner(anatoly, Animal).
owner(ivan, murka) :- \+ owner(nickolay, muska), \+ has_pedigree(muhtar).

% Наличие родословной
has_pedigree(Animal) :- owner(Owner, Animal), Owner = anatoly ; Owner = nickolay.

% Животные без хозяина
no_owner(Animal) :- (cat(Animal); dog(Animal)), \+ owner(_, Animal).

/*result
?- no_owner(Animal).
Animal = murka ;
Animal = muhtar.

*/

