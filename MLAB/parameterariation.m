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
figure
coltitles = {'F_SOL_OUT','R','d','lambda'};
for i=1:3
  hAx(i)=subplot(1,3,i);
  plot(d.daemm.(coltitles{i})(((i-1)*5+1):(i*5)),d.daemm.F_SOL_OUT(((i-1)*5+1):(i*5)))
end
linkaxes(hAx,'y')
set(hAx,'ylim',[0.54 0.68])


figure
grid on
subplot(1,3,1)
grid on
plot(d.daemm.R(1:8),d.daemm.F_SOL_OUT(1:8),'--x')
xlabel('Rohrlänge [m]')
ylabel('$f_{sol,out}$')
pbaspect([1 2 1])
subplot(1,3,2)
grid on
plot(d.daemm.d(9:16),d.daemm.F_SOL_OUT(9:16),'--x')
xlabel('Dämmstärke [mm]')
ylabel('$f_{sol,out}$')
pbaspect([1 2 1])
subplot(1,3,3)
grid on
plot(d.daemm.lambda(17:24),d.daemm.F_SOL_OUT(17:24),'--x')
xlabel('$\lambda$ [$\frac{W}{m*K}$]')
ylabel('$f_{sol,out}$')
pbaspect([1 2 1])
ylim=[0.54 0.68]
print('../DATA/Aufgabe2.3.eps','-depsc');
