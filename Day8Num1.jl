x = readlines( "C:\\Users\\Brian\\Documents\\AdventOfCode2021\\inputs\\day8input.txt" );
numStr = split.(x, " | ");


function parseDigits( x )
    
    
    k = 0;
    for i = 1:length( numStr )
        
        numThis = (split(x[i][2], " "));
        for j = 1:4 
            if length( numThis[j] ) == 2 || length( numThis[j] ) == 4 || length( numThis[j] ) == 3 ||  length( numThis[j] ) == 7
                k = k + 1;
            end
        end
    end
    # 2 4 3 7
    return k;
end

numDigits = parseDigits( numStr );