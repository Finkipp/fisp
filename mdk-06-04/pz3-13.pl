% Тип животного
animal(dog).
animal(cat).
animal(horse).

% Индивидуальные животные
dog(resvyi).
dog(rex).
cat(belka).
horse(bystraja).

% Цвет животных
color(resvyi, black).
color(belka, white).
color(rex, red).
color(bystraja, white).

% Владельцы
owner(tom, Animal) :- dog(Animal), color(Animal, Color), Color \= black.
owner(kate, Animal) :- (color(Animal, black); horse(Animal)).

% Домашнее животное
domestic_animal(Animal) :- (dog(Animal); cat(Animal)).

% Все животные
all_animals(Animal) :- animal(Animal); domestic_animal(Animal).

/*result
?- all_animals(Animal).
Animal = dog ;
Animal = cat ;
Animal = horse ;
Animal = resvyi ;
Animal = rex ;
Animal = belka.

?- domestic_animal(Animal).
Animal = resvyi ;
Animal = rex ;
Animal = belka.

?- owner(tom, Animal).
Animal = rex.

?- owner(kate, Animal).
Animal = resvyi ;
Animal = bystraja.

?- color(Animal, white).
Animal = belka ;
Animal = bystraja.

?- all_animals(Animal), not(domestic_animal(Animal)).
Animal = dog ;
Animal = cat ;
Animal = horse ;
false.

*/