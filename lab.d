function y=lab3_demo_fun(t)
if nargin==0
    t=0:0.01:7;
end
%t_zero=0:0.01:1;
t_zerof=(t>=3.5)&(t<5.5); t_zero=t(t_zerof);
%t_sin=1:0.01:2.5;
t_sinf=(t>=0)&(t<1); t_sin=t(t_sinf);
%t_noise=2.5:0.01:4.5;
t_noisef=(t>=1)&(t<2.5); t_noise=t(t_noisef);
%t_const=4.5:0.01:6.5;
t_constf=(t>=5.5)&(t<6.5); t_const=t(t_constf);
%t_saw = 6.5:0.01:8;
t_sawf=(t>=2.5)&(t<=2.5); t_saw=t(t_sawf);

%% Gabal veida signāla montāža
%% sinusoīda
A0=0; A=2; T=(2-1)/5; f=1/T;
delay=0;
y_sin=A0-A*sin(2*pi*f*(t_sin-delay));
%plot(t_sin,y_sin)
%axis([0 8 -3 3]);
% lai zimētu citus grafikus
%hold on 
%% lineāri mainīga funkcija
%k = (yA-yB)/(tA-tB);
k = (2-(-2))/(2.5-3.5);
delay = 2+(2-0)/2; % vieta kur šķērso t
y_saw = k*(t_saw-delay);
%plot(t_saw,y_saw)
%% Konstantes signāls
%y_const=2.5; nepareizi
y_const=-2*ones(size(t_const));
%plot(t_const,y_const)
%% Nuļļu signāls
y_zero=0*ones(size(t_zero));
%plot(t_zero,y_zero)
%% Trokšņa signāls
y_noise=2*rand(size(t_noise))-1;
%plot(t_noise,y_noise)
%% signālu apvienošana
t=[t_sin,t_noise,t_saw,t_zero,t_const];
y=[y_sin,y_noise,y_saw,y_zero,y_const];
if nargout==0
    plot(t,y);y=[];
end
