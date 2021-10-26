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
dfs2(Dest,Dest,LA,Cam):-reverse(LA,Cam).
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


% g) Implemente o método Primeiro em Largura.

