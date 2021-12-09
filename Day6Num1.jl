x = readlines( ".\\inputs\\day6input.txt" );

numStr = split(x[1], ",");
nums = parse.(Int64, numStr);

numDays = 80;


function multiplyFish( fishList, numDays )

    
    for i = 1:numDays
        
        fishList = fishList .- 1;
        addFish = sum( fishList .== -1 )
        if ( addFish > 0 )
            append!(fishList, 8 .* ones(Int64, addFish));
            fishList[fishList .== -1] .= 6;
        end

    end
    return length(fishList);

end

fishList = multiplyFish( nums, numDays )