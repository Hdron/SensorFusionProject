function [x, P] = mu_m(x, P, mag, m0,Rm)
     h = Qq(x)*m0;
    [Q0, Q1, Q2, Q3] = dQqdq(x);
    H = [Q0'*m0, Q1'*m0, Q2'*m0, Q3'*m0];
    
    S = H*P*H' + Rm;
    K = P*H'*inv(S);
    
    x = x + K*(mag-h);
    P = P - K*S*K';

end

