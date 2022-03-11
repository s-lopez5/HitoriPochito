%Marcar casilla en negro
{black(X,Y)} :- cell(X,Y,N).

%Adyacentes
:- black(X,Y), black(X+1,Y), row(Y).
:- black(X,Y), black(X,Y+1), column(X).
%:- black(X,Y), black(X-1,Y), row(Y).
%:- black(X,Y), black(X,Y-1), column(X).

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
#show cell/3.
