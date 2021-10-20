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

% Exercício 1 - g) Linearizar uma lista, ou seja, numa lista cujos elementos podem ser
%   atómicos ou outras listas devolver a lista com todos os átomos da lista
%   original. Por exemplo:
%   ?- flatten([[a,b,c],[d,[e,f],g],h],L).
%   L = [a,b,c,d,e,f,g,h]
% percorrer a lista e ir retirando até ela ficar vazia e em cada elemento ter
%




% Exercício 1 - h) Eliminar a 1ª ocorrência de um elemento numa lista

concatena([],L,L).
concatena([X|L],L1,[X])

% Exercício 1 - h) Eliminar a 1ª ocorrência de um elemento numa lista

apaga1(_,[],[]).
apaga1(X,[X|L,L]):-!.
apaga1(X,[Y|L],[Y|L1]):-apaga1(X,L,L1).

% Exercício 1 - i) Eliminar todas as ocorrências de um elemento numa lista
% percorrer a lista retirando elemento a elemento até q ela fique vazia

apagarlista(_,[],[]).
apagarlista(X,[X|T],T).
apagarlista(X,[Y|T1],[Y|T2]):-
    apagarlista(X,T1,T2).

% Exercício 1 - j) Substituir todas as ocorrências de um dado elemento numa lista por um outro elemento
% percorrer a lista trocando elemento a elemento até q ela fique vazia

trocarelementodelista(_,[],[]).
trocarelementodelista(X,[X|T],T).
trocarelementodelista(X,[X|T1],[X|T2]):-
    trocarelementodelista(X,T1,T2).


% Exercício 1 - k) Inserir um elemento numa dada posição numa lista
% percorrer a lista e cada vez q percorre incrementa uma variavel q quando tome o valor da posição
% leva a q se faça o append do elemento na lista

% Exercício 1 - l) Inverter uma lista
% revert das tps

reverse(L1,L2):-
    reverse(L1,[],L2).
    reverse([],L,L).
    reverse([X|Y],A,L):-
    reverse(Y,[X|A],L).


% Exercício 1 - m) União de dois conjuntos representados por listas (os conjuntos não
% admitem elementos repetidos) união das tps

member(X,[X|_]).
member(X,[_|L]):-member(X,L).

union([],L,L).
union([X|L1],L2,LU):-
    member(X,L2),!,union(L1,L2,LU).
union([X|L1],L2,[X|LU]):-
        union(L1,L2,LU).

% Exercício 1 - n) Intersecção de dois conjuntos representados por listas
% interseção das tps

member(X,[X|_]).
member(X,[_|L]):-member(X,L).

intersection([],_,[]).
intersection([X|L1],L2,[X|LI]):-member(X,L2),!,intersection(L1,L2,LI).
intersection([_,L1],L2,LI):-intersection(L1,L2,LI).

% Exercício 1 - o) Diferença entre dois conjuntos representados por listas, ou seja, gera um
% conjunto com os elementos que pertencem a um dos dois conjuntos, mas não a ambos

