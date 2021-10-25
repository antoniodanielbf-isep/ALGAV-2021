% 1) Considere o seguinte predicado escrito em PROLOG:
r(X, L, L1) :- p(X, L, [ ], L1).
p(0, L, LA, L1) :- ! , append(LA, L, L1).
p(N, [X|L], LA, L1) :- N1 is N-1, p(N1, L, [X|LA], L1).

% a) Faça a traçagem do que acontece e qual é o resultado em L quando se põe a questão:
% ?- r(3, [1,3,2,1,4], L).
% Não faça a traçagem do “append”. Use o verso desta página para a traçagem.

% b) O que faz o predicado r quando é chamado com o primeiro argumento instanciado
% com um valor inteiro não negativo, o segundo argumento com uma lista instanciada e o
% terceiro argumento com uma lista não instanciada. Sem fazer a traçagem indique o
% valor de L para a seguinte questão:
% ?- r(4,[5,1,2,4,6,7],L).

% c) Acha que seriam geradas novas soluções para além da encontrada na alínea a) se o
% cut (!) do predicado p fosse retirado e fossem pedidas novas soluções? Se acha que sim
% diga quais seriam todas as soluções geradas para o caso da questão posta na alínea a).
% Se acha que não, justifique qual a razão de não aparecerem novas soluções e diga o que
% aconteceria.


% 2) Escreva um predicado totobola/2 que a partir de uma aposta múltipla de totobola
% representada numa lista seja capaz de gerar as apostas simples correspondentes. As
% apostas simples são representadas por um carater (1,x ou 2) e as múltiplas por uma lista

?-totobola([1,x,2,[x,2],[1,x,2],1,2,1,x,1,1,x,2],L).
L=[1,x,2,x,1,1,2,1,x,1,1,x,2];
L=[1,x,2,x,x,1,2,1,x,1,1,x,2];
L=[1,x,2,x,2,1,2,1,x,1,1,x,2];
L=[1,x,2,2,1,1,2,1,x,1,1,x,2];
L=[1,x,2,2,x,1,2,1,x,1,1,x,2];
L=[1,x,2,2,2,1,2,1,x,1,1,x,2]

r(X, L, L1) :- p(X, L, [ ], L1).
p(0, L, LA, L1) :- ! , append(LA, L, L1).
p(N, [X|L], LA, L1) :- N1 is N-1, p(N1, L, [X|LA], L1).
?- r(3, [1,3,2,1,4], L).


