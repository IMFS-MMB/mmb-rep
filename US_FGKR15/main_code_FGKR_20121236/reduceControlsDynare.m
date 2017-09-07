% This function reduces the elements in the control vector based on the
% specified variables in opt.ySelect
% By Martin M. Andreasen
function [ny,label_y,gSteadyState,gv,gvv,gss,gvvv,gssv,gsss] = ...
    reduceControlsDynare(opt,nv,ny_tmp,label_y_tmp,gSteadyState_tmp,gv_tmp,gvv_tmp,gss_tmp,gvvv_tmp,gssv_tmp,gsss_tmp)

if strcmp(opt.ySelect,'all') ~= 1 
     % Ensure that ySelect is a column vector of strings
     [ny1,ny2] = size(opt.ySelect);
     if ny2 > ny1
         opt.ySelect = opt.ySelect';
         ny          = ny2;
     else
         ny          = ny1;
     end
     gSteadyState = zeros(ny,1);
     gv           = zeros(ny,nv);
     gvv          = zeros(ny,nv,nv);
     gss          = zeros(ny,1);
     gvvv         = zeros(ny,nv,nv,nv);
     gssv         = zeros(ny,nv);
     gsss         = zeros(ny,1);
     label_y      = cell(ny,1);
     for i=1:ny
        for j=1:ny_tmp
            if strcmp(cellstr(opt.ySelect(i,:)),cellstr(label_y_tmp(j,:))) == 1
                label_y(i,:)      = label_y_tmp(j,:);
                gSteadyState(i,:) = gSteadyState_tmp(j,:);
                gv(i,:)           = gv_tmp(j,:);
                gvv(i,:,:)        = gvv_tmp(j,:,:);
                gss(i,:)          = gss_tmp(j,:);                
                gvvv(i,:,:,:)     = gvvv_tmp(j,:,:,:);                
                gssv(i,:)         = gssv_tmp(j,:);                
                gsss(i,:)         = gsss_tmp(j,:);                                
            end
        end
    end
else
    ny           = ny_tmp;
    label_y      = label_y_tmp;
    gSteadyState = gSteadyState_tmp;
    gv           = gv_tmp;
    gvv          = gvv_tmp;
    gss          = gss_tmp;
    gvvv         = gvvv_tmp;
    gssv         = gssv_tmp;
    gsss         = gsss_tmp;
end

end

