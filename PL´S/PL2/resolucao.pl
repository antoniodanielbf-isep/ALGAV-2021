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

lista([]).
lista(LISTA):-(\+ var(LISTA)),
              (\+ atomic(LISTA)).

achatar([],[]).
achatar([CABECA|CAUDA],LISTAA):-
    lista(CABECA),
    achatar(CABECA,CABECAA),
    achatar(CAUDA,CAUDAA),
    concatenar(CABECAA,CAUDAA,LISTAA).

achatar([CABECA|CAUDA],[CABECA|CAUDAA]):- \+ lista(CABECA),
                                          achatar(CAUDA,CAUDAA).


flatten([],[]).
flatten([[H|T]|L],LF):-!,
    append([H|T],L,L1),
    flatten(L1,LF).
flatten([X|L],[X|LF]):-flatten(L,LF).


% Exercício 1 - h) Eliminar a 1ª ocorrência de um elemento numa lista

concatena([],L,L).
concatena([A|B],C,[A|D]):-concatena(B,C,D).

% Exercício 1 - h) Eliminar a 1ª ocorrência de um elemento numa lista

apaga1(_,[],[]).
apaga1(X,[X|L],L):-!.
apaga1(X,[Y|L],[Y|L1]):-apaga1(X,L,L1).

% Exercício 1 - i) Eliminar todas as ocorrências de um elemento numa lista
% percorrer a lista retirando elemento a elemento até q ela fique vazia

apagarlista(_,[],[]).
apagarlista(X,[X|T],T).
apagarlista(X,[Y|T1],[Y|T2]):-
    apagarlista(X,T1,T2).

% Exercício 1 - j) Substituir todas as ocorrências de um dado elemento numa lista por um outro elemento
% percorrer a lista trocando elemento a elemento até q ela fique vazia

trocarelementodelista(_,_,[],[]).
trocarelementodelista(X,Y,[X|L],[Y|L1]):-!,trocarelementodelista(X,Y,L,L1).
trocarelementodelista(X,Y,[Z|L],[Z|L1]):-trocarelementodelista(X,Y,L,L1).

% Exercício 1 - k) Inserir um elemento numa dada posição numa lista
% percorrer a lista e cada vez q percorre incrementa uma variavel q quando tome o valor da posição
% leva a q se faça o append do elemento na lista

retirarelemento(_,[],[]).
retirarelemento(X,[X|L],L):-!.
retirarelemento(X,[Y|L],[Y|L1]):-retirarelemento(X,L,L1).

inserir(ELEMENTO,LISTA,LISTA1):-
        retirarelemento(ELEMENTO,LISTA1,LISTA).

%ou
insere(X,1,L,[X|L]):-!.
insere(X,N,[Y|L],[Y|L1]):- N1 is N-1, insere(X,N1,L,L1).


% Exercício 1 - l) Inverter uma lista
% revert das tps

inverte(L1,L2):-inverte1(L1,[],L2).

inverte1([],L,L).
inverte1([X|Y],A,L):-write('Lista [X|A] = '),write([X|A]),nl,inverte1(Y,[X|A],L).


% Exercício 1 - m) União de dois conjuntos representados por listas (os conjuntos não
% admitem elementos repetidos) união das tps

uniao([],L,L).
uniao([X|L1],L2,LU):-
    member(X,L2),!,uniao(L1,L2,LU).
uniao([X|L1],L2,[X|LU]):-
        uniao(L1,L2,LU).

% Exercício 1 - n) Intersecção de dois conjuntos representados por listas
% interseção das tps

intersection([],_,[]).
intersection([X|L1],L2,[X|LI]):-member(X,L2),!,intersection(L1,L2,LI).
intersection([_,L1],L2,LI):-intersection(L1,L2,LI).

% Exercício 1 - o) Diferença entre dois conjuntos representados por listas, ou seja, gera um
% conjunto com os elementos que pertencem a um dos dois conjuntos, mas não a ambos

diferencaconjuntos(C1,C2,CONJUNTODIFERENCA):-
    findall(ELEMENTOA,(member(ELEMENTOA,C1),\+ member(ELEMENTOA,C2)),CONJUNTODIFERENCA1),
    findall(ELEMENTOB,(member(ELEMENTOB,C2),\+ member(ELEMENTOB,C1)),CONJUNTODIFERENCA2),
    uniao(CONJUNTODIFERENCA1,CONJUNTODIFERENCA2,CONJUNTODIFERENCA).

%ou

diferenca(L1,L2,LD):-diferenca1(L1,L2,LD12),diferenca1(L2,L1,LD21),append(LD12,LD21,LD).
diferenca1([],_,[]).
diferenca1([X|L1],L2,LD):-member(X,L2),
        !,
        diferenca1(L1,L2,LD).
diferenca1([X|L1],L2,[X|LD]):-diferenca1(L1,L2,LD).