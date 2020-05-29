function [x, P] = mu_g(x, P, yacc, Ra, g0)
   
    h = Qq(x)'*g0;
    [Q0, Q1, Q2, Q3] = dQqdq(x);
    H = [Q0'*g0, Q1'*g0, Q2'*g0, Q3'*g0];
    
    S = H*P*H' + Ra;
    K = P*H'*inv(S);
    
    x = x + K*(yacc-h);
    P = P - K*S*K';

end

