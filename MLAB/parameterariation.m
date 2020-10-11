%% Init
clc;
clear;
close all;
%% Import Data
d.fsol = importfile('../DATA/Aufgabe2.2.xlsx');
d.daemm = importfile1('../DATA/Aufgabe2.3.xlsx');


%% Plot T-SP-Amb, T-KW
names = {'$T_{Sp}$ = 5$^{\circ}C$','$T_{Sp}$ = 10$^{\circ}C$','$T_{Sp}$ = 15$^{\circ}C$','$T_{Sp}$ = 20$^{\circ}C$','$T_{Sp}$ = 25$^{\circ}C$','$T_{Sp}$ = 30$^{\circ}C$'}
hold on 
grid on
plot(d.fsol.TAMB(1:6),d.fsol.F_SOL_OUT(1:6),'--x','LineWidth',0.75)
plot(d.fsol.TAMB(1:6),d.fsol.F_SOL_OUT(7:12),'--o','LineWidth',0.75)
plot(d.fsol.TAMB(1:6),d.fsol.F_SOL_OUT(13:18),'--x','LineWidth',0.75)
plot(d.fsol.TAMB(1:6),d.fsol.F_SOL_OUT(19:24),'--^','LineWidth',0.75)
plot(d.fsol.TAMB(1:6),d.fsol.F_SOL_OUT(25:30),'--d','LineWidth',0.75)
plot(d.fsol.TAMB(1:6),d.fsol.F_SOL_OUT(31:36),'--s','LineWidth',0.75)
xlabel('$T_{KW}$ [$^{\circ}C$]')
ylabel('$f_{sol,out}$')
%ylim([0.60 0.63])
pbaspect([3 1 1])
legend(names,'location','southoutside','NumColumns',3)
%legend('boxoff')
run plotsettings.m
print('../DATA/Aufgabe2.2.eps','-depsc');

%% Plot 

subplot(1,3,1,'replace')
plot(d.daemm.R(1:3),d.daemm.F_SOL_OUT(1:3))
xlabel('Rohrlänge [m]')
ylabel('$f_{sol,out}$')
pbaspect([1 2 1])
subplot(1,3,2,'replace')
plot(d.daemm.d(4:6),d.daemm.F_SOL_OUT(4:6))
xlabel('Dicke Dämmung [cm]')
ylabel('$f_{sol,out}$')
pbaspect([1 2 1])
subplot(1,3,3,'replace')
plot(d.daemm.lambda(7:9),d.daemm.F_SOL_OUT(7:9))
xlabel('$\lambda$ [$\frac{W}{m*K}$]')
ylabel('$f_{sol,out}$')
pbaspect([1 2 1])
print('../DATA/Aufgabe2.3.eps','-depsc');
