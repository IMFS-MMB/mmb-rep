% This function computes B*Cov(xi_t+1+s,z_t) for a DSGE approximated up to
% third order. 
% By Martin Andreasen 2011

function BCov_xiLeadS_z = Get_BCov_xiLeadS_z(hx,hxx,hxxx,hssx,sigeta,sig,...
    E_xs,E_xf_xf,E_xf_xs,E_xf_xf_xf,Var_xfxf,Var_xs_xfxf,nx,ne,LeadS)

% The dimension of BCov_z_xi_leads
BCov_xiLeadS_z = zeros(3*nx+2*nx^2+nx^3,3*nx+2*nx^2+nx^3);

% A useful matrix
if LeadS == 0
    hx_LeadS = eye(nx);
else
    hx_LeadS = hx^LeadS;
end

% For 1) to 3)
E_xf_xfLeadS = E_xf_xf*hx_LeadS';

% for 4) to 6) 
E_xs_xfLeadS = (E_xf_xs)'*hx_LeadS';

% for 7) to 9) 
E_xfxf_xfLeadS = reshape(E_xf_xf_xf,nx^2,nx)*hx_LeadS';
E_xf_xf_xfLeadS = reshape(E_xfxf_xfLeadS,nx,nx,nx);

% for 10) to 12)
% Computing E_xs_xf_xf and E_xrd_xf 
E_xs_xfxf = Var_xs_xfxf+E_xs*reshape(E_xf_xf,1,nx^2);
E_xs_xf_xf = reshape(E_xs_xfxf,nx,nx,nx);
% Compute E_xfxs_xf
E_xf_xs_xf = zeros(nx,nx,nx);
for gama1=1:nx
    for gama2=1:nx
        E_xf_xs_xf(gama1,gama2,:) = E_xs_xf_xf(gama2,gama1,:);
    end
end
E_xfxs_xf = reshape(E_xf_xs_xf,nx^2,nx);
E_xrd_xf = inv(eye(nx)-hx)*(reshape(hxx,nx,nx^2)*E_xfxs_xf...
            +1/6*reshape(hxxx,nx,nx^3)*reshape(Var_xfxf,nx^3,nx)...
            +3/6*hssx*sig*E_xf_xf);
E_xrd_xfLeadS = E_xrd_xf*hx_LeadS';

% for 13) to 15)
E_xfxs_xfLeadS  = E_xfxs_xf*hx_LeadS';
E_xf_xs_xfLeadS = reshape(E_xfxs_xfLeadS,nx,nx,nx);

% for 16) to 18)
% Computing E_xfxfxf_xfLagS
E_xfxf             = reshape(E_xf_xf,nx^2,1);
E_xf_xf_xf_xf      = reshape(Var_xfxf+E_xfxf*E_xfxf',nx,nx,nx,nx);
E_xf_xf_xf_xfLeadS = zeros(nx,nx,nx,nx);
for gama1=1:nx
    for gama2=1:nx
        for gama3=1:nx
            E_xf_xf_xf_xfLeadS(gama1,gama2,gama3,:)= ...
                reshape(E_xf_xf_xf_xf(gama1,gama2,gama3,:),1,nx)*hx_LeadS';
        end
    end
end


% 1) 
E_xf_xfeps2 = zeros(nx,nx*ne^2);
for gama1=1:nx
    index2 = 0;
    for gama2=1:nx
        for phi1=1:ne
            for phi2=1:ne
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xf_xfeps2(gama1,index2) = E_xf_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_1_9 = E_xf_xfeps2;

% 2)
E_xf_epsxfeps = zeros(nx,ne*nx*ne);
for gama1=1:nx
    index2 = 0;
    for phi1=1:ne
        for gama2=1:nx
            for phi2=1:ne
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xf_epsxfeps(gama1,index2) = E_xf_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_1_10 = E_xf_epsxfeps;

% 3)
E_xf_eps2xf = zeros(nx,ne*ne*nx);
for gama1=1:nx
    index2 = 0;
    for phi1=1:ne
        for phi2=1:ne
            for gama2=1:nx
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xf_eps2xf(gama1,index2) = E_xf_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_1_11 = E_xf_eps2xf;


% 4)
E_xs_xfeps2 = zeros(nx,nx*ne*ne);
for gama1=1:nx
    index2 = 0;
    for gama2=1:nx
        for phi1=1:ne
            for phi2=1:ne
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xs_xfeps2(gama1,index2) = E_xs_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_2_9 = E_xs_xfeps2;

% 5)
E_xs_epsxfeps = zeros(nx,ne*nx*ne);
for gama1=1:nx
    index2 = 0;
    for phi1=1:ne
        for gama2=1:nx
            for phi2=1:ne
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xs_epsxfeps(gama1,index2) = E_xs_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_2_10 = E_xs_epsxfeps;

% 6)
E_xs_eps2xf = zeros(nx,ne*ne*nx);
for gama1=1:nx
    index2 = 0;
    for phi1=1:ne
        for phi2=1:ne
            for gama2=1:nx
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xs_eps2xf(gama1,index2) = E_xs_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_2_11 = E_xs_eps2xf;


% 7)
E_xfxf_xfeps2 = zeros(nx*nx,nx*ne*ne);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for gama3=1:nx
            for phi1=1:ne
                for phi2=1:ne
                    index2 = index2 + 1;
                    if phi1==phi2
                        E_xfxf_xfeps2(index1,index2) = E_xf_xf_xfLeadS(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end
r_3_9 = E_xfxf_xfeps2;

% 8)
E_xfxf_epsxfeps = zeros(nx*nx,ne*nx*ne);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for phi1=1:ne
            for gama3=1:nx
                for phi2=1:ne
                    index2 = index2 + 1;
                    if phi1==phi2
                        E_xfxf_epsxfeps(index1,index2) = E_xf_xf_xfLeadS(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end
r_3_10 = E_xfxf_epsxfeps;

% 9)
E_xfxf_eps2xf = zeros(nx*nx,ne*ne*nx);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        index1 = index1 + 1;
        index2 = 0;
        for phi1=1:ne
            for phi2=1:ne
                for gama3=1:nx
                    index2 = index2 + 1;
                    if phi1==phi2
                        E_xfxf_eps2xf(index1,index2) = E_xf_xf_xfLeadS(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end
r_3_11 = E_xfxf_eps2xf;

% 10)
E_xrd_xfeps2 = zeros(nx,nx*ne*ne);
for gama1=1:nx
    index2 = 0;
    for gama2=1:nx
        for phi1=1:ne
            for phi2=1:ne
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xrd_xfeps2(gama1,index2) = E_xrd_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_4_9 = E_xrd_xfeps2;

% 11) 
E_xrd_epsxfeps = zeros(nx,ne*nx*ne);
for gama1=1:nx
    index2 = 0;
    for phi1=1:ne
        for gama2=1:nx
            for phi2=1:ne
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xrd_epsxfeps(gama1,index2) = E_xrd_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_4_10 = E_xrd_epsxfeps;

% 12)
E_xrd_eps2xf = zeros(nx,ne*ne*nx);
for gama1=1:nx
    index2 = 0;
    for phi1=1:ne
        for phi2=1:ne
            for gama2=1:nx
                index2 = index2 + 1;
                if phi1 == phi2
                    E_xrd_eps2xf(gama1,index2) = E_xrd_xfLeadS(gama1,gama2);
                end
            end
        end
    end
end
r_4_11 = E_xrd_eps2xf;

% 13)
E_xfxs_xfeps2 = zeros(nx*nx,nx*ne*ne);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        index1 = index1+1;
        index2 = 0;
        for gama3=1:nx
            for phi1=1:ne
                for phi2=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2
                        E_xfxs_xfeps2(index1,index2) = E_xf_xs_xfLeadS(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end
r_5_9 = E_xfxs_xfeps2;

% 14) 
E_xfxs_epsxfeps = zeros(nx*nx,ne*nx*ne);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        index1 = index1+1;
        index2 = 0;
        for phi1=1:ne
            for gama3=1:nx
                for phi2=1:ne
                    index2 = index2 + 1;
                    if phi1 == phi2
                        E_xfxs_epsxfeps(index1,index2) = E_xf_xs_xfLeadS(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end
r_5_10 = E_xfxs_epsxfeps;

% 15)
E_xfxs_eps2xf = zeros(nx*nx,ne*ne*nx);
index1 = 0;
for gama1=1:nx
    for gama2=1:nx
        index1 = index1+1;
        index2 = 0;
        for phi1=1:ne
            for phi2=1:ne
                for gama3=1:nx
                    index2 = index2 + 1;                    
                    if phi1 == phi2
                        E_xfxs_eps2xf(index1,index2) = E_xf_xs_xfLeadS(gama1,gama2,gama3);
                    end
                end
            end
        end
    end
end
r_5_11 = E_xfxs_eps2xf;

% 16) 
E_xfxfxf_xfeps2 = zeros(nx*nx*nx,nx*ne*ne);
index1=0;
for gama1=1:nx
    for gama2=1:nx
        for gama3=1:nx
            index1=index1+1;
            index2=0;
            for gama4=1:nx
                for phi1=1:ne
                    for phi2=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2
                            E_xfxfxf_xfeps2(index1,index2) = ...
                                E_xf_xf_xf_xfLeadS(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end
r_6_9 = E_xfxfxf_xfeps2;

% 17)
E_xfxfxf_epsxfeps = zeros(nx*nx*nx,ne*nx*ne);
index1=0;
for gama1=1:nx
    for gama2=1:nx
        for gama3=1:nx
            index1=index1+1;
            index2=0;
            for phi1=1:ne
                for gama4=1:nx
                    for phi2=1:ne
                        index2 = index2 + 1;
                        if phi1 == phi2
                            E_xfxfxf_epsxfeps(index1,index2) = ...
                                E_xf_xf_xf_xfLeadS(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end
r_6_10 = E_xfxfxf_epsxfeps;

% 18)
E_xfxfxf_eps2xf = zeros(nx*nx*nx,ne*ne*nx);
index1=0;
for gama1=1:nx
    for gama2=1:nx
        for gama3=1:nx
            index1=index1+1;
            index2=0;
            for phi1=1:ne
                for phi2=1:ne
                    for gama4=1:nx
                        index2 = index2 + 1;
                        if phi1 == phi2
                            E_xfxfxf_eps2xf(index1,index2) = ...
                                E_xf_xf_xf_xfLeadS(gama1,gama2,gama3,gama4);
                        end
                    end
                end
            end
        end
    end
end
r_6_11 = E_xfxfxf_eps2xf;

% The R matrix
R = [r_1_9   r_1_10   r_1_11 ;
     r_2_9   r_2_10   r_2_11 ;
     r_3_9   r_3_10   r_3_11 ;     
     r_4_9   r_4_10   r_4_11 ;          
     r_5_9   r_5_10   r_5_11 ;               
     r_6_9   r_6_10   r_6_11 ];                    

% Auxiliary matrix
tmp = [kron(hx,kron(sigeta,sigeta)) kron(sigeta,kron(hx,sigeta)) kron(sigeta,kron(sigeta,hx))];

% Collecting the results
BCov_xiLeadS_z(3*nx+2*nx^2+1:3*nx+2*nx^2+nx^3,:) = tmp*R';
