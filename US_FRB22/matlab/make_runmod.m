%*******************************************************************
% Program to create the Dynare model file runmod.mod that is used
% to run stochastic simulations. This model is created by reading
% in the text for the selected expectational version of LINVER
% and then editing it as needed to be consistent with the model
% parameters as defined in make_parameters. 
%********************************************************************

disp("Constructing runmod.mod file"); 
fail_flag = "no";

% Open runmod.mod and initialize it as an empty file

fileID = fopen('runmod.mod','w');
fprintf(fileID,'%s',""); 


% Retrieve text defining the selected expectational version of
% LINVER with its base-case endogenous variable declarations,
% exogenous variable declarations, parameter declarations, and
% model equations.

a = "expvers_" + expvers + ".txt";
modtext = string(readcell(a,'FileType','text','Delimiter',''));


% Find key lines in modtext
varline = find(modtext == "var") + 1; 
varexoline = find(modtext == "varexo") + 1; 
ruleline = find(modtext == "[name='rule']") + 1; 


% Override the specification of the RULE equation in the model so
% that it equals the selected rule. If the selected rule is one of
% the nonlinear ones (adur or aait), specify RULE as the inertial
% Taylor rule; in this case, the nonlinear portion of the rule will
% be imposed through additive adjustments to the RFF path.

if mprule == "tay"
    a="rule=rstar+1.5*picx4-0.5*pitarg+1.0*xgap2;"; 
end
if mprule == "intay" | mprule == "adur" | mprule == "aait"
    a="rule=.85*rff(-1)+.15*rstar+.225*picx4-0.075*pitarg+.15*xgap2;";
end
if mprule == "fpt"
    a="rule=rstar+1.5*picx4-0.5*pitarg+1.0*xgap2+1.0*pcnia_l;";
end
if mprule == "infpt"
    a="rule=.85*rff(-1)+.15*rstar+.225*picx4-0.075*pitarg+.14*xgap2+.15*pcnia_l;";
end
if mprule == "ait"
    a="rule=.85*rff(-1)+.15*rstar+.15*picx4+1.20*pic32-1.20*pitarg+.15*xgap2;";
end
if mprule == "rw"
    a="rule=rstar+1.5*picx4-0.075*pitarg+1.0*xgap2+.25*rwterm(-1);";
end
if mprule == "kr"
    a="rule=rule(-1)+.4*picx4-.4*pitarg+.4*xgap2;";
end
modtext(ruleline) = a;



% If the selected monetary policy rule is the RW make-up rule,
% add RWTERM to the declaration list of endogenous variables and 
% append its equation to modtext.

if mprule == "rw"    
    a = modtext(varline);
    a = a + " rwterm";
    modtext(varline) = a;
    loc = find(modtext=="end;");
    modtext(loc) = "[name='rwterm']";
    loc = loc + 1;
    a="rwterm=rwterm(-1)+rstar+1.5*picx4+1.0*xgap2-rff;";
    modtext(loc) = a;
    loc = loc + 1;
    modtext(loc) = "end;";
end



% If the selected monetary policy rule is the adur rule, add DLUR2
% and UCOND to the declaration list of endogenous variables and
% append their equations to modtext.  

if mprule == "adur"
    a = modtext(varline);
    a = a + " dlur2 ucond";
    modtext(varline) = a;
    loc = find(modtext=="end;");
    modtext(loc) = "[name='dlur2']";
    loc = loc + 1;
    a="dlur2=lur-lur(-2);";
    modtext(loc) = a;
    loc = loc + 1;
    modtext(loc) = "[name='ucond']";
    loc = loc + 1;
    a="ucond=lur-lurnat;";
    modtext(loc) = a;
    loc = loc + 1;
    modtext(loc) = "end;";
end



% If the selected monetary policy rule is the ait rule or the aait
% rule, add PIC32 to the declaration list of endogenous variables
% and append its equation to modtext.

if mprule == "ait" | mprule == "aait"
    a = modtext(varline);
    a = a + " pic32";
    modtext(varline) = a;
    loc = find(modtext=="end;");
    modtext(loc) = "[name='pic32']";
    loc = loc + 1;
    a="pic32 = 12.5*pcnia_l - 12.5*pcnia_l(-32);";
    modtext(loc) = a;
    loc = loc + 1;
    modtext(loc) = "end;";
end



% If the ELB constraint is imposed or a nonlinear policy rule is
% used, modify the declaration lists of endogenous and exogenous
% variables and add new equations for the additive adjustments. 

if elb_imposed == "yes" | mprule == "adur" | mprule == "aait"
    
    % Add eradd variables to the endogenous list
    a = modtext(varline);
    a = a + " eradd ";
    if predqtrs>1
        for i = 2:predqtrs
            j = i-1;
            a = a + "eradd" + num2str(j) + " ";
        end
    end
    
    % Add ucond if an unemployment threshold is imposed and the
    % adur rule is not used
    if uthresh_imposed == "yes" & mprule ~= "adur" 
        a = a + " ucond";
    end
        
    % Add picond to the list if an inflation threshold is imposed  
    if pithresh_imposed == "yes"
        a = a + " picond";
    end
             
    % Update the endogenous declaration list
    modtext(varline) = a;
    
    % Remove eradd from the exogenous variable declaration list
    a = modtext(varexoline);
    a = strrep(a," eradd","");

    % Add to the exogenous variable declaration list the expected 
    % additive adjustments to the path of the federal funds rate -- 
    % that is, e0,e1, ... , eN, where N equals predqtrs-1.
    a = a + " e0 ";
    if predqtrs>1
        for i = 2:predqtrs
            j = i-1;
            a = a + "e" + num2str(j) + " ";
        end
    end
    modtext(varexoline) = a;

    % Find the end of the list of equations
    loc = find(modtext=="end;");
    
    % Add ERADD equations
    if predqtrs == 1
        modtext(loc) = "[name='eradd']";
        loc = loc + 1;
        a = "eradd = e0;";
        modtext(loc) = a;
        loc = loc + 1;
    end
    if predqtrs == 2
        modtext(loc) = "[name='eradd']";
        loc = loc + 1;
        a = "eradd = eradd1(-1) + e0;";
        modtext(loc) = a;
        loc = loc + 1;
        modtext(loc) = "[name='eradd1']";
        loc = loc + 1;
        a = "eradd1 = e1;";
        modtext(loc) = a;
        loc = loc + 1;
    end
    if predqtrs > 2
        modtext(loc) = "[name='eradd']";
        loc = loc + 1;
        a = "eradd = eradd1(-1) + e0;";
        modtext(loc) = a;
        loc = loc + 1;
        for i = 2:predqtrs-1
            j = i-1;
            a = "[name='eradd" + num2str(j) + "']";
            modtext(loc) = a;
            loc = loc + 1;
            a = "eradd" + num2str(j) + " = eradd";
            a = a + num2str(i) + "(-1) + e" + num2str(j) + ";"; 
            modtext(loc) = a;
            loc = loc + 1;
        end
        j = predqtrs-1;
        a = "[name='eradd" + num2str(j) + "']";
        modtext(loc) = a;
        loc = loc + 1;
        a = "eradd" + num2str(j) + " = e" + num2str(j) + ";";
        modtext(loc) = a;
        loc = loc + 1;
    end
        
    % Add an equation for UCOND if an unemployment threshold is 
    % imposed and the adur policy rule is not used
    if uthresh_imposed == "yes" & mprule ~= "adur"
        modtext(loc) = "[name='ucond']";
        loc = loc + 1;
        modtext(loc) = "ucond = lur - lurnat;";
        loc = loc + 1;
    end
    
    % Add an equation for PICOND if an inflation threshold is
    % imposed  
    if pithresh_imposed == "yes"
        modtext(loc) = "[name='picond']";
        loc = loc + 1;
        if pithresh_var == "pic4"
            a = "picond = pic4;";
        end
        if pithresh_var == "pic12"
            a = "picond = 33.333*pcnia_l - 33.333*pcnia_l(-12);";
        end
        if pithresh_var == "pic20"
            a = "picond = 20*pcnia_l - 20*pcnia_l(-20);";
        end
        if pithresh_var == "picx4"
            a = "picond = picx4;";
        end
        if pithresh_var == "picx12"
            a = "picond = 33.333*pcxfe_l - 33.333*pcxfe_l(-12);";
        end
        if pithresh_var == "picx20"
            a = "picond = 20*pcxfe_l - 20*pcxfe_l(-20);";
        end
        modtext(loc) = a;
        loc = loc + 1;
    end
        
    % Close off equation declarations section
    modtext(loc) = "end;";
end



% Ensure that fiscal policy is setting to targeting the
% surplus-to-GDP ratio

loc = find(modtext=="[name='trpt']") + 1;
if isempty(loc)==1 
    disp("Error: cannot locate the TRPT equation");
    fail_flag = "yes";
    return
end
modtext(loc) = "trpt = trpts ;";


% Set Y_TRPTS_5 in the model file equal to tax_gamma

z = erase(modtext," ");
loc = find(contains(erase(modtext," "),"y_trpts_5="));
if isempty(loc) == 1
    disp("Error: cannot locate where Y_TRPTS_5 is defined");
    fail_flag = "yes";
    return
else
    modtext(loc) = "y_trpts_5 = " + num2str(tax_gamma) + ";";
end


% Rewrite the Treasury term premium equations if the user has opted
% to suppress or modify their cyclical components

if ctp_option > 0
    loc1 = find(modtext=="[name='rg5p']") + 1;
    loc2 = find(modtext=="[name='rg10p']") + 1;
    loc3 = find(modtext=="[name='rg30p']") + 1;
    if isempty(loc1)==1 | isempty(loc2)==1 | isempty(loc3)==1
        disp("error: cannot located term premium equations");
        fail_flag = "yes";
        return
    end
end
if ctp_option == 1
    a1 = modtext(loc1);
    a2 = modtext(loc2);
    a3 = modtext(loc3);
    a1 = replace(a1,"zgap05","0*zgap05");
    a2 = replace(a2,"zgap10","0*zgap10");
    a3 = replace(a3,"zgap30","0*zgap30");
    modtext(loc1) = a1;
    modtext(loc2) = a2;
    modtext(loc3) = a3;
end
if ctp_option == 2
    a1 = "rg5p = rg5p_aerr - .48042*xgap2 + .80720*xgap2(-1) ";
    a1 = a1 + "- .33889*xgap2(-2) + .85925*rg5p(-1);";
    a2 = "rg10p = rg10p_aerr - .25313*xgap2 + .44366*xgap2(-1) "; 
    a2 = a2 + "- .19421*xgap2(-2) + .90377*rg10p(-1);"; 
    a3 = "rg30p = rg30p_aerr - .03935*xgap2 + .08758*xgap2(-1) ";
    a3 = a3 + "- .04712*xgap2(-2) + .91071*rg30p(-1);";
    modtext(loc1) = a1;
    modtext(loc2) = a2;
    modtext(loc3) = a3;
end


% Append a Dynare model parsing command at the end of the file

loc = find(modtext=="end;") + 1;
a = "stoch_simul(nograph,noprint,nofunctions,nocorr,drop=0,irf=0,order=1,periods=50);";
modtext(loc) = a;


% Save edited text as Dynare model file and close runmod.mod

fprintf(fileID,'%s\n',modtext);
fclose('all');


% Run Dynare to evaluate the model. If the model has errors, Dynare
% will end in an error and execution will stop (so fail_flag is not
% needed).

disp("Calling Dynare to parse runmod.mod");
disp("  ");
eval(sprintf('%s %s %s','dynare runmod',[' noclearall ' 'nostrict']))

    
    
    




