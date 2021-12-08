x = readlines( ".\\inputs\\day6input.txt" );

numStr = split(x[1], ",");
nums = parse.(Int64, numStr);

numDays = 256;


function multiplyFish( fishList, numDays )

    nDays = zeros(Int64, 8);
    for j = 1:8
        nDays[j] = length( fishList[ fishList .== j] );
    end
    
    zeroDaysPrev = 0;
    zeroDaysThis = 0;
    
    for i = 1:numDays
        
        zeroDaysThis = nDays[1];
        nDays[1:7] = nDays[2:8];
        nDays[6] = nDays[6] + zeroDaysPrev;
        nDays[8] = zeroDaysPrev;

        zeroDaysPrev = zeroDaysThis;

    end
    return sum(nDays)+zeroDaysThis;

end

fishList = multiplyFish( nums, numDays )