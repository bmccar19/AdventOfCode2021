x = readlines( "C:\\Users\\Brian\\Documents\\AdventOfCode2021\\inputs\\day3input.txt" );


function getBinary( x )
    m = zeros( length(x), length(x[1]) );
    for i = 1:length(x)
        for j = 1:length(x[i])
            m[i,j] = parse(Int32, x[i][j]);
        end
    end
    
    return m;
end

M = getBinary( x );
numZeros = zeros(length(M[1,:]));
numOnes = zeros(length( M[1,:]));

function getZerosAndOnes( M )

    for i = 1:length(numZeros)
        numOnes[i] = sum(M[:,i]);
        numZeros[i] = length(M[:,i]) - numOnes[i];
    end
    return numOnes, numZeros;
end

numZeros,numOnes= getZerosAndOnes(M)

function convertBinary( numZeros, numOnes )
    
    mostCommon = "";
    leastCommon = "";
    for i = 1:length( numZeros)
        if numOnes[i] > numZeros[i]
            mostCommon = mostCommon * "1";
            leastCommon = leastCommon * "0";
        else
            mostCommon = mostCommon * "0";
            leastCommon = leastCommon * "1";
        end
    end        

    mostComInt = parse(Int, mostCommon; base=2);
    leastComInt = parse(Int, leastCommon; base=2);

    return mostComInt, leastComInt;
end
    
mostComInt, leastComInt = convertBinary(numZeros, numOnes)