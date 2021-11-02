% a) Escreva a Base de Conhecimento representando os arcos do grafo por
% factos do tipo liga/2 (por exemplo “liga(a,b).”).

% É a BC do Moodle

% liga(a,c).
% liga(c,g).


liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(g,h).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

% b) Implemente o método Primeiro em Profundidade
%  ?- dfs(a,j,Caminho).
% Caminho = [a, b, e, j]

dfs(Orig,Dest,Cam):-dfs2(Orig,Dest,[Orig],Cam).
dfs2(Dest,Dest,LA,Cam):-!,reverse(LA,Cam). % o not serve para que no backtracking ele pare o algoritmo, devolvendo apenas o primeiro resultado
dfs2(Atual,Dest,LA,Cam):-liga(Atual,X),
                            \+ member(X,LA),
                            dfs2(X,Dest,[X|LA],Cam).




% c) Coloque os factos “liga(a,c).” e “liga(c,g)” como os primeiros da Base de
% Conhecimento e verifique que caminho é gerado.

% Trocar ordem de 2 factos e pedir soluções




% d) Implemente um predicado que coloque todas as soluções existentes
% numa lista de soluções.

% Usar o findall




% e) Implemente um predicado que obtenha a solução que passa por menos
% nós.

% Sobre a solução do findall que gera uma lista de listas obter a menor lista
% Usar length(L,NL)
% ?-length([a,b,c],NL).
% NL= 3.


% f) Altere o Primeiro em Profundidade para considerar níveis de corte.
% 1f - com niveis de corte

dfscl(Orig,Dest,Cam,N):-dfscl2(Orig,Dest,[Orig],Cam,N).
dfscl2(Dest,Dest,LA,Cam,_):-!,reverse(LA,Cam). % o not serve para que no backtracking ele pare o algoritmo, devolvendo apenas o primeiro resultado
dfscl2(Atual,Dest,LA,Cam,N):- N > 0,
                            liga(Atual,X),
                            \+ member(X,LA),N1 is N - 1,
                            dfscl2(X,Dest,[X|LA],Cam,N1).


% g) Implemente o método Primeiro em Largura.
% 1g primeiro em largura : teórica

%A visita em largura começa por um vértice inicial qualquer, e depois vai então visitar os seus adjacentes, e depois
%Distingue entre os visitados e não visitados e continua a visitar todos os vértices até que se tenha percorrido tudo.

bfs(Orig,Dest,Cam):-bfs2(Orig,Dest,[[Orig]],Cam).
bfs2(Dest,[[Dest|T]|_],Cam):-!,reverse([Dest|T],Cam).
bfs2(Dest,[LA|Outros],Cam):-LA = [Act|_],findall([X|LA]),
        (Dest\== Act, liga(Act,X), \+member(X,LA),Novos),       % \+member(X,LA) evita caminhos cíclicos
        append(Outros,Novos,Todos),
        bfs2(Dest,Cam,Todos).

