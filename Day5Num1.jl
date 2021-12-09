x = readlines( ".\\inputs\\day5input.txt" );


function parseData( x )
    numStr = split.(x, ",");
    xy = zeros(Int64, length(numStr), 4);
    
    for i = 1:length( numStr )
        xy[i,1] = parse(Int64, numStr[i][1]);
        xy[i,2], xy[i,3] = parse.(Int64, split(numStr[i][2], " -> "));
        xy[i,4] = parse(Int64, numStr[i][3]);
    end
    return xy;
end

xy = parseData( x );

slopes = ( xy[:,3] - xy[:,1] ) ./ ( xy[:,4] - xy[:,2] );

b = xy[:,2] - ( slopes .* xy[:,1] );




