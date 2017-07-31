%*************heaviside函数****************************************%
function H= Heavisidefunction(epsilon, x)
H=0.5*(1+(2/pi)*atan(x./epsilon));
