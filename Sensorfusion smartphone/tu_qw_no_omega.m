function [x, P] = tu_qw_no_omega(x, P, T, Rw)
    %No Omega
    F = eye(4);
    G = 0.5 * Sq(x) * T;
    
    x = F*x;
    P = F*P*F' + G*Rw*G';

end

