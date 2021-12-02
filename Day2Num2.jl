x = readlines( "C:\\Users\\Brian\\Documents\\AdventOfCode2021\\inputs\\day2input.txt" );

el = split.(x)


let forwardTotal = 0, aimTotal = 0, depthTotal = 0;
    for i = 1:length( el )

        if  el[i][1] == "forward"
            forwardTotal = forwardTotal + parse(Int64,el[i][2]);
            depthTotal = depthTotal + parse(Int64, el[i][2])*aimTotal;
            
        elseif el[i][1] == "up" || el[i][1] == "down"
            if el[i][1] == "up"
                upThis = parse(Int64, el[i][2]);
                aimTotal = aimTotal - upThis;
            elseif el[i][1] == "down"
                downThis = parse(Int64, el[i][2]);
                aimTotal = aimTotal + downThis;
            end

        end
    end

    answer = forwardTotal * depthTotal
end