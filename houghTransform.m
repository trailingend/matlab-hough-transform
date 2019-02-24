function [H] = houghTransform(I, threshold, rhoResolution, thetaResolution)

% Calculate scale bins of H for theta and rho
    [row, col] = size(I);
    thetaRange = 0: thetaResolution: pi;
    rhoRange = 0: rhoResolution: sqrt(row^2 + col^2);
    
% Allocate memory for H
    H = zeros(length(thetaRange), length(rhoRange));
    
% Iterate over image and calculate rho for all theta per pixel
    % Perform voting
    for i = 1: 1: row % y
        for j = 1: 1: col % x
            if (I(i, j) > threshold)
                for theta = thetaRange
                    rho = round(j * cos(theta) + i * sin(theta));
                    if (rho >= 0) 
                        targetTheta = floor(theta / thetaResolution) + 1;
                        targetRho = floor(rho / rhoResolution) + 1;
                        H(targetTheta, targetRho) = H(targetTheta, targetRho) + 1;
                    end
                end
            end
        end
    end
end
        