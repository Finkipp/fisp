plays(martynka, violin).
plays(osel, viola).
plays(kozel, cello).
plays(mishka, double_bass).

% правила
quartet(X, Y, Z, W) :-
    plays(X, violin),
    plays(Y, viola),
    plays(Z, cello),
    plays(W, double_bass).
    
% музыканты которые могут составить квартет
quartet_members(Members) :-
    findall(M, plays(M, _), Musicians),
    findall(Q, (member(X, Musicians), member(Y, Musicians), member(Z, Musicians), member(W, Musicians), 
                 X \= Y, X \= Z, X \= W, Y \= Z, Y \= W, Z \= W, 
                 quartet(X, Y, Z, W)), Members).

/*result
?- plays(X, viola).
X = osel.

?- plays(martynka, Instrument).
Instrument = violin.

?- quartet(martynka, osel, kozel, mishka).
true.

?- quartet_members(Musicians).
Musicians = [_].
/*