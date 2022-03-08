digit(1..5).
row(0..4).
column(0..4).

cell(0,0,1).cell(1,0,1).cell(2,0,2).cell(3,0,1).cell(4,0,4).
cell(0,1,1).cell(1,1,5).cell(2,1,5).cell(3,1,4).cell(4,1,3).
cell(0,2,1).cell(1,2,4).cell(2,2,1).cell(3,2,3).cell(4,2,2).
cell(0,3,2).cell(1,3,5).cell(2,3,3).cell(3,3,3).cell(4,3,5).
cell(0,4,4).cell(1,4,2).cell(2,4,5).cell(3,4,1).cell(4,4,1).

%Marcar casilla en negro
{black(X,Y)} :- cell(X,Y,N).

%Adyacentes
:- black(X,Y), black(X+1,Y), row(Y).
:- black(X,Y), black(X,Y+1), column(X).
:- black(X,Y), black(X-1,Y), row(Y).
:- black(X,Y), black(X,Y-1), column(X).

%No repetir numeros en la misma fila/columna
:- cell(X,Y,N), cell(X,Y',N), Y!=Y', not black(X,Y), not black(X,Y'), row(Y').
:- cell(X,Y,N), cell(X',Y,N), X!=X', not black(X,Y), not black(X',Y), column(X').

%Acceso a todas las casillas blancas
conect(cell(X,Y), cell(X,Y-1)) :- column(X), row(Y-1), not black(X,Y), not black(X,Y-1).
conect(cell(X,Y), cell(X-1,Y)) :- column(X-1), row(Y), not black(X,Y), not black(X - 1, Y).
conect(cell(X,Y), cell(X,Y+1)) :- column(X), row(Y+1), not black(X,Y), not black(X,Y+1).
conect(cell(X,Y), cell(X+1,Y)) :- column(X+1), row(Y), not black(X,Y), not black(X+1, Y).
conect(cell(X,Y), cell(X',Y')) :- column(X),column(X'), column(A), row(Y), row(Y'), row(B), conect(cell(X,Y),cell(A,B)), conect(cell(A,B),cell(X',Y')).
:- column(X), column(X'), row(Y), row(Y'), not black(X,Y), not black(X',Y'), not conect(cell(X,Y),cell(X',Y')).

#show black/2.
