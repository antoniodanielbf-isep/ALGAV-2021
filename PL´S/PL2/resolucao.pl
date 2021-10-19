% Exercício 1 - a) Obter a média de uma lista de inteiros

conta([],0).
conta([_|L],C):- conta(L,C1), C is C1+1.

soma([],0).
soma([X|L],S):- soma(L,S1), S is S1+X.

media(L,M):-L\==[],conta(L,C), soma(L,S),
           M is S/C.


% ou

contaSoma([],0,0).
contaSoma([X|L],C,S):- contaSoma(L,C1,S1),
          C is C1+1,
          S is X+S1.

media1(L,M):- contaSoma(L,C,S),
          M is S/C.


% Exercício 1 - b) Obter o menor valor de uma lista de inteiros

menor([X],X):-!.
menor([X|L],M):- menor(L,M1),
                 ((X<M1,!,M is X );M is M1).
                 % if      then     else

% Exercício 1 - c) Contar o número de elementos pares e ímpares numa lista de inteiros

contarLista([],0,0).
conta([_|L],I,P):- conta(L,I1,P1), I is I1+1,P is P1+1.

contaPI([],0,0).
contaPI([X|L],P,I):- contaPI(L,P1,I1), R is X mod 2,
((R==0,!,P is P1 + 1, I is I1) ; (P is P1, I is I1 + 1)).



% Exercício 1 - d) Verificar se uma lista tem elementos repetidos

repetidos([X|L]):-member(X,L),!.
repetidos([_|L]):- repetidos(L).


% Exercício 1 - e) Colocar o menor elemento da lista à frente da lista


menorFrenteLista([],[]):-!.
menorFrenteLista(L,[M,L1]):- menor(L,M),
                        apaga1(M,L,L1).


% Exercício 1 - h) Eliminar a 1ª ocorrência de um elemento numa lista

apaga1(_,[],[]).
apaga1(X,[X|L,L]):-!.
apaga1(X,[Y|L],[Y|L1]):-apaga1(X,L,L1).






























