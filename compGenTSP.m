%Función que recibe una población desordenada, esta función la ordena y
%regresa la mitad con mejor aptitud. 
function [F,P,Prob]=compGenTSP(P,C_Mat)
Plen=size(P.chromosome(:),1);
Plen2=Plen/2;
[F,P,Prob]=fitTSP(P,C_Mat);
P.chromosome=P.chromosome(1:Plen2);
F=F(1:Plen2);
Prob=Prob(1:Plen2);
end