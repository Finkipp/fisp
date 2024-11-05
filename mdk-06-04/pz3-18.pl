% Время обеда
lunch_time(Hour) :- between(12, 15, Hour).

% Время сна
sleep_time(Hour) :- between(22, 24, Hour); between(0, 7, Hour).

% Время между 14 и 19 часами
between_14_and_19(Hour) :- between(14, 19, Hour).

/*result
?- lunch_time(Hour).
Hour = 12 ;
Hour = 13 ;
Hour = 14 ;
Hour = 15.

?- between_14_and_19(Hour).
Hour = 14 ;
Hour = 15 ;
Hour = 16 ;
Hour = 17 ;
Hour = 18 ;
Hour = 19.

?- findall(Hour, sleep_time(Hour), Hours), length(Hours, Count).
Hours = [22, 23, 24, 0, 1, 2, 3, 4, 5|...],
Count = 11.

*/