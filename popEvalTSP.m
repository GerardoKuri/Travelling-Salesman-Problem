%Función que recibe una población no necesariamente ordenada por aptitud
%y la matriz descriptiva de las ditancias del problema.
%Devuelve la aptitud del cromosoma mejor adaptado,la aptitud promedio de
%la población y la distancia del cromosoma mejor adaptado.
function [best,mean,distance]=popEvalTSP(P,C_Mat)
[F,P,Prob]=fitTSP(P,C_Mat);
len=size(F(:),1);
best=F(1);
mean=sum(F)/len;
distance=P.chromosome(1).distance;
end