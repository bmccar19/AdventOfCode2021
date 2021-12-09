x = readlines( ".\\inputs\\day7input.txt" );

numStr = split(x[1], ",");
nums = parse.(Int64, numStr);

minVal = minimum(nums);
maxVal = maximum(nums);

function getFuelUsage( nums )

    minVal = minimum(nums);
    maxVal = maximum(nums);

    k = 1;
    fuelUsage = zeros(maxVal-minVal+1);
    for i = minVal:maxVal
        fuelAll = abs.(nums .- i);
        fuelUsage[k] = sum( fuelAll );
        k = k + 1;
    end
    return fuelUsage;
end

fuelUse = getFuelUsage(nums)