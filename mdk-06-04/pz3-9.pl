grade(bobrov,5,3,2).
grade(vyatkin,5,5,5).
grade(krotov,2,3,3).
grade(sosnin,4,4,4).
grade(vavilov,4,2,1).

% правила
excellent_student(X) :- 
    grade(X, 5, 5, 5).

dropout(X) :- 
    grade(X, 2, _, _).

mathematician(X) :- 
    grade(X, Grade1, Grade2, _),
    (Grade1 = 4; Grade1 = 5),
    (Grade2 = 4; Grade2 = 5).

% сказуемые
algebra(X, Y) :- grade(X, Y, _, _).
geometry(X, Y) :- grade(X, _, Y, _).
history(X, Y) :- grade(X, _, _, Y).

/*result
?- excellent_student(vyatkin).
true.

?- findall(Name, excellent_student(Name), ExcellentStudents).
ExcellentStudents = [vyatkin].

?- mathematician(sosnin).
true .

?- findall(Name, dropout(Name), FailingHistoryStudents).
FailingHistoryStudents = [krotov].

?- algebra(bobrov, Grade).
Grade = 5.

?- history(Name, 2).
Name = bobrov.

?- findall(Name, dropout(Name), StudentsWithTwos).
StudentsWithTwos = [krotov].
*/