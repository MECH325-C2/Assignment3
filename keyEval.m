function keyEval()
w=  3/8; %width, inches
h = 3/8; %height, inches


nf = 2;
Sy = 24000; %G10060
%% drum shaft
Fd = 2*525.3/1.5; %force, lbf
rectKeyCalc(Fd, w, h, Sy, nf)
retRingCalc(1.5,0.2/25.4,0.5/25.4, 24000, 77000, 3)

%% motor shaft
Fm = 2 * 52.68 / 1.5;
rectKeyCalc(Fm, w, h, Sy, nf)
end

function l = rectKeyCalc(F, w,h,Sy,nf)
%Calculates required length of key/keyway for given parameters.

%Params:
%   F: Force on surface of shaft (2T/D) (lb)
%   w: given width of key (use table 7-6) (in)
%   h: given height of key (table 7-6) (in)
%   Sy: yield strength of key material (from table A-20) (psi)
%   nf: desired safety factor (preferably low; around 1.5?)

%Returns:
%   l length of key


%%  Failure from shear
Ls = F/(w*0.577*Sy) * nf;

%%  Failure from compression

Lc = 2*F/(h*Sy)*nf;

l = max(Ls,Lc);

end

function  t= retRingCalc(D, d, t, Sy_r,Sy_s,n)
%Calculates maximum axial load before ring/groove failure.

%params: 
%   D=shaft diameter (in)
%   d=groove depth (in)
%   t = ring width (in)
%   Sy_r = ring yield strength
%   Sy_s = shaft yield strength
%   n = safety factor

%t1 = n*Pmax/(pi*D*0.577*Sy);
Pmaxr = (1/n)*.577*Sy_r*pi*D*t;
Pmaxg = (1/n)*Sy_s*pi*D*d;
t = min(Pmaxr,Pmaxg);

end
