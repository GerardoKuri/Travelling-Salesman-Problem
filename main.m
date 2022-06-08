clear all;
close all;
clc;
%%
%Captura de par�metros iniciales 
M=100;
delta=0.00000002;
chroNo=100;
genNo=18;
D=0;
deltaVar=inf;
deltaIt=5;
tic
%%
%Generaci�n de poblaci�n y evaluci�n de poblaci�n generada
P=pop_init_TSP(genNo,chroNo);
C_Mat=xlsread('DistanciasCiudades_v2.xlsx',1,'B2:S19');
[best,mean,distance]=popEvalTSP(P,C_Mat);
[fit,P,Prob]=fitTSP(P,C_Mat);
cont=1;
X(cont)=cont;
Ymean(cont)=mean;
Ybest(cont)=best;
Ydist(cont)=distance;
%%
%Generaci�n y evaluci�n de generaciones: criterio de t�rmino es iteraciones
%m�ximas = M y promedio de aptitud > epsilon 
while cont<M & D<deltaIt
    %Selecci�n de parejas a cruzar
    P=selecTSP('Mono',P,C_Mat);
    %Cruza de poblaci�n 
    P=Ox(P);
    %Criterio elitista: Competencia gen�tica
    [F,P,Prob]=compGenTSP(P,C_Mat);
    %Evaluaci�n de nueva generaci�n y captura del hijo medio y mejor
    %adaptado
    [best,mean,distance]=popEvalTSP(P,C_Mat);
    cont=cont+1;
    X(cont)=cont;
    Ymean(cont)=mean;
    Ybest(cont)=best;
    Ydist(cont)=distance;
    %%
    %C�lculo del diferencial entre cada  generaci�n
    Delta=mean-deltaVar;
    if (Delta)<delta
        D=D+1;
    else
        D=0;
    end
    deltaVar=mean;
end
toc
%%
%Gr�fica de Hijo Medio
subplot(1,2,1);
plot(X,Ymean,'-b');
hold on;
plot(X,Ymean,'*k');
title('Hijo Medio');
ylabel('Aptitud');
xlabel('Iteraci�n #');
hold on;
%%
%Gr�fica de menor distancia
subplot(1,2,2);
plot(X,Ydist,'-b');
hold on;
plot(X,Ydist,'*k');
title('Menor distancia');
ylabel('Distancia');
xlabel('Iteraci�n #');
hold on;









