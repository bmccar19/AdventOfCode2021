x = readlines( "C:\\Users\\Brian\\Documents\\AdventOfCode2021\\inputs\\day2input.txt" );

el = split.(x)

let forwardTotal = 0, upTotal = 0, downTotal = 0;
    for i = 1:length( el )

        if  el[i][1] == "forward"
            forwardTotal = forwardTotal + parse(Int64,el[i][2]);
        elseif el[i][1] == "up"
            upTotal = upTotal + parse(Int64, el[i][2]);
        elseif el[i][1] == "down"
            downTotal = downTotal + parse(Int64, el[i][2]);
        end
    end

    answer = forwardTotal * ( downTotal -upTotal)
end