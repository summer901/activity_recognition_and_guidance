
outputfile = {'numHoofBins', 'numSymbols', 'numStates', '1','2','3','4','5','6','7','8','acc'};
counter = 2;

for numHoofBins = 10:4:90
    for numSymbols = 5:15:155
        for numStates = 3:3:30
            [accuracy, actionAccuracies] = crossValidation(...
                numHoofBins, numStates, numSymbols, 10);
            
            outputfile(counter,1:3) = {numHoofBins, numSymbols, numStates};
            outputfile(counter,12) = {accuracy};
            for i = 4:11
                outputfile(counter,i) = {actionAccuracies(i-3)};
            end
            
            counter = counter + 1;
            save('outputs.mat', 'outputfile');
        end
    end
end

save('outputs.mat', 'outputfile');