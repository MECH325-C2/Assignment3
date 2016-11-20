function keyEval()
w=  3/8; %width, inches
h = 3/8; %height, inches

F = 2*467/1.5; %force, lbf
nf = 2;
Sy = 24000;
rectKeyCalc(F, w, h, Sy, nf)
retRingCalc(25,1.5, 24000, 3)
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

function d = retRingCalc(Pmax, D, Sy,n)
%Calculates ring thickness given 
d = n*Pmax/(pi*D*0.577*Sy)

end
