/*Considere o seguinte predicado escrito em PROLOG:
p([_],0). caso base, um elemento de uma lista fica zero
p([x(A,B),x(C,D)|L],M):- A=<B, B=<C, C=<D, M1 is C-B, trata dois elementos da lista, e garante q os elementos estão ordenados por ordem crescente
p([x(C,D)|L],M2), ((M1<M2,!,M is M2);M is M1). estamos perante um if then else
a) Faça a traçagem do que acontece, indicando no final qual o valor que toma V quando
se põe a questão:
?- p([x(1,3),x(9,10),x(17,22),x(22,27)],V).*/


% falha o p([_],0).
% Dps no p([x(A,B),x(C,D)|L],M) temos A = 1, B =3, C=9, D =10, L = [x(17,22),x(22,27)]
% e portanto 1 <= 3, 3 =< 9, 9<=10, M1 is 6 (9-3)
% De seguida temos p([x(9,10),x(17,22),x(22,27),M2]).

% Recursivamente desço um nível e temos
% falha o p([_],0)
% Dps no p([x(A,B),x(C,D)|L],M) temos A = 9, B =10, C=17, D =22, L = [x(22,27)]
% e portanto 9 <= 10, 10 =< 17, 17<=22, M1 is 7 (17-10)
% De seguida temos p([x(17,22),x(22,27),M2]).

% Recursivamente desço um nível e temos
% falha o p([_],0)
% Dps no p([x(A,B),x(C,D)|L],M) temos A = 17, B =22, C=22, D =27, L = [_]
% e portanto 17 =< 22, 22 =< 22, 22 =< 27, M1 is 0 (22-22)
% De seguida temos p([x(22,27),M2]).

% Recursivamente desço um nível e temos
% sucesso no p([_],0)
% agora iremos voltar atrás (backtracking), desfazer e fazer outras coisas
% vamos voltar ao sítio onde foi chamado e estamos com M2 = 0

% no p([x(22,27),M2]) temos (0<0,...) q falha e M2 = 0 e M is M1, M1 com valor zero
% e atingiu o sucesso nessa alternativa do M is 0

% volta para o sítio donde foi chamado, q é p([x(22,27),M2])
% no p([x(17,22),x(22,27),M2]) temos (7<0,...); q falha e M2 = 0 e M is M1, M1 com valor 7
% e atingiu o sucesso nessa alternativa do M is 7

% volta para o sítio donde foi chamado, q é p([x(17,22),x(22,27),M2])
% no p([x(9,10),x(17,22),x(22,27),M2]) temos (6<7,!,M is 7);... q tem sucesso e M2 = 7 e M is M1, M1 com valor 6
% e atingiu o sucesso nessa alternativa do M is 6

% dps volta ent ao predicado inicial p([x(1,3),x(9,10),x(17,22),x(22,27)],V).

%---------------------------------------------------------------------%

/* b) O que faz o predicado p quando é chamado com uma lista de termos x/2 (functor x e
aridade de 2 argumentos numéricos) e uma variável não instanciada no segundo
argumento? Sem fazer a traçagem diga qual seria o resultado da seguinte questão:
?- p([x(2,2),x(5,7),x(10,15),x(20,21),x(27,29)],M).
*/

% iria dar M = 6, dps M = 5, dps M = 3 e dps M = 3

/*

c) Acha que seriam geradas novas soluções para além da encontrada na alínea a) se o
cut (!) do predicado p fosse retirado e fossem pedidas novas soluções? Se acha que sim
diga qual seria a próxima solução gerada a seguir a que foi encontrada na alínea a). Se
acha que não, justifique qual a razão de não aparecerem novas soluções e diga o que
aconteceria.
*/




/*2) Escreva um predicado absoluto/3 que a partir de duas listas de números inteiros não
negativos de igual dimensão cria uma terceira lista com o valor absoluto da diferença
dos valores em posições idênticas.
?- absoluto([3,1,2,6], [1,4,2,1], L).
L = [2,3,0,5]
p([_],0).
p([x(A,B),x(C,D)|L],M):- A=<B, B=<C, C=<D, M1 is C-B,
p([x(C,D)|L],M2), ((M1<M2,!,M is M2);M is M1).
?- p([x(1,3),x(9,10),x(17,22),x(22,27)],V).*/



absoluto([X|L],[Y|L],[Z|L3]):-
        X<Y,!,Z is X-Y,
        absoluto(L,L1,L2).
        absoluto([X|L],[Y|L1],[Z|L2]):-
            Z is Y-X,
            absoluto(L,L1,L2).

            %%OU%%
        absoluto([X|L],[Y|L1],[Z|L2]):-
        ((X>Y,!,Z is X-Y);Z is Y-X),
        absoluto(L,L1,L2).