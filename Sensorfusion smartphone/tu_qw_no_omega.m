function [x, P] = tu_qw_no_omega(x, P, T, Rw)
    %No Omega
    alpha = 2*acos(x(1));

    F = eye(4);
    G = 0.5 * Sq(x) * T;
    A = F + G*[0 1 1 1]*(1/sin(0.5*alpha));
    
    x = A*x;
    P = A*P*A' + Rw;
end

