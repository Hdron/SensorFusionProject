function [x, P] = tu_qw(x, P, omega, T, Rw)
    
    alpha = 2*acos(x(1));
    
    %H = inv(Sq(x))*2; 
    
    %Sk = H*P*H' + Rw;
    %Kk = P*H'*inv(Sk);
    
    % Update step
   % x = x + Kk*(y-hx);
    %P = P - Kk*Sk*Kk';
    
    F = eye(4) + 0.5 * Somega(omega) * T;
    G = 0.5 * Sq(x) * T;
    A = F + G*[0 1 1 1]*(1/sin(0.5*alpha));
    
    x = A*x;
    P = A*P*A' + Rw;
    
end

