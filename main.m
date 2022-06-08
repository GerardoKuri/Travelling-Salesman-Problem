clear all;
close all;
clc;
%%
%Captura de parámetros iniciales 
M=100;
delta=0.00000002;
chroNo=100;
genNo=18;
D=0;
deltaVar=inf;
deltaIt=5;
tic
%%
%Generación de población y evalución de población generada
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
%Generación y evalución de generaciones: criterio de término es iteraciones
%máximas = M y promedio de aptitud > epsilon 
while cont<M & D<deltaIt
    %Selección de parejas a cruzar
    P=selecTSP('Mono',P,C_Mat);
    %Cruza de población 
    P=Ox(P);
    %Criterio elitista: Competencia genética
    [F,P,Prob]=compGenTSP(P,C_Mat);
    %Evaluación de nueva generación y captura del hijo medio y mejor
    %adaptado
    [best,mean,distance]=popEvalTSP(P,C_Mat);
    cont=cont+1;
    X(cont)=cont;
    Ymean(cont)=mean;
    Ybest(cont)=best;
    Ydist(cont)=distance;
    %%
    %Cálculo del diferencial entre cada  generación
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
%Gráfica de Hijo Medio
subplot(1,2,1);
plot(X,Ymean,'-b');
hold on;
plot(X,Ymean,'*k');
title('Hijo Medio');
ylabel('Aptitud');
xlabel('Iteración #');
hold on;
%%
%Gráfica de menor distancia
subplot(1,2,2);
plot(X,Ydist,'-b');
hold on;
plot(X,Ydist,'*k');
title('Menor distancia');
ylabel('Distancia');
xlabel('Iteración #');
hold on;









