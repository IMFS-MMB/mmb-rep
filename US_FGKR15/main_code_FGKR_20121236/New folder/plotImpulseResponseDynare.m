% By Martin M. Andreasen
function plotImpulseResponseDynare(IRFy,IRFx,labely,labelx,nameOfShocks,shockSize,order_app)

% Some dimensions
length = size(IRFx,2);

% Merging impulse response functions
IRFall = [IRFy;IRFx];
% Merging labels
labelAll = [labely;labelx];
          
defaultFigRow = 3;
defaultFigCol = 2;
totalCharts   = size(IRFall,1);
numFig = ceil(totalCharts/(defaultFigRow*defaultFigCol));

% x-axix
dimX = 0:size(IRFall,2);

idxTotal = 0;
for idxFig=1:numFig
    figure('NumberTitle','off','Name',['Shock to: ' char(nameOfShocks) '; Figure = ' num2str(idxFig)]);
    if totalCharts-idxTotal >= 5
        figRow = defaultFigRow;
        figCol = defaultFigCol;
    elseif totalCharts-idxTotal == 4 || totalCharts-idxTotal == 3
        figRow = 2;
        figCol = defaultFigCol;
    else
        figRow = 1;
        figCol = defaultFigCol;
    end
    for i = 1:figRow*figCol
        idxTotal = idxTotal + 1;
        if totalCharts >= idxTotal 
            subplot(figRow,figCol,i);
            % Plotting impulse response at first order
            hold on
            if any(abs(reshape(IRFall(idxTotal,:,1),length,1)) > 1e-10)
                plot (dimX,[0; reshape(IRFall(idxTotal,:,1),length,1)],'-k');
            else
                plot (dimX,[0; reshape(0*IRFall(idxTotal,:,1),length,1)],'-k');
            end
            if order_app > 1
                % Plotting impulse response at the chosen order
                if any(abs(reshape(IRFall(idxTotal,:,order_app),length,1)) > 1e-10)
                    plot (dimX,[0; reshape(IRFall(idxTotal,:,order_app),length,1)],'-r');
                else
                    plot (dimX,[0; reshape(0*IRFall(idxTotal,:,order_app),length,1)],'-r');
                end
            end
            title(char(labelAll(idxTotal)));
            axis tight
            hold off
        end
        if i == 1
           % Legends
           legend({'Approximation order = 1',['Approximation order = ' num2str(order_app)]},'Orientation','horisontal','Location','NorthEast','EdgeColor',[1 1 1]);
        end
    end
end
        
        
end