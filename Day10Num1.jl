x = readlines( ".\\inputs\\day10input.txt" );

function findWrongBrackInLine( x )
    elements = split(x,"");
    elType = zeros(Int32, length(elements));
    idx = 0;
    for i = 1:length( elements )
        elType[i] = leftOrRight( elements[i] );

        if elType[i] == 1
            chk = 1;
            k = 1;
            bracketCount = 1;
            while bracketCount != 0 && (i+k) <= length( elements )
                bracketCount = bracketCount + leftOrRight(elements[i+k]);
                k = k + 1;
            end
            if ( (i+k-1) < length(elements ) )
                if isBracketSetEqual( elements[i], elements[i+k-1] ) != 1
                    idx = i+k-1;
                    return idx;
                    break;
                end
            end 

        end
    end

    return idx;


end


function leftOrRight( element )
    if element == "{" || element == "[" || element == "(" || element == "<" 
        return 1
    elseif element == "}" || element == "]" || element == ")" || element == ">"
        return -1;
    end
end

function isBracketSetEqual( element1, element2 )
    if ( element1 == "{" && element2 == "}" ) || ( element1 == "[" && element2 == "]" )|| ( element1 == "(" && element2 == ")" )|| ( element1 == "<" && element2 == ">" )
        return 1;
    else
        return 0;
    end
end
    

function computeScore( lines )

    totalScore = 0;

    for i = 1:length(lines)
        idx = 0;
        idx = findWrongBrackInLine( lines[i] )
        elements = split(lines[i], "");
        if idx != 0
            totalScore = totalScore + getBracketScore( elements[idx] );
        end
    end

    return totalScore;
end

function getBracketScore( element )
    if ( element == ")")
        return 3;
    elseif element == "]"
        return 57;
    elseif element == "}"
        return 1197;
    elseif element == ">"
        return 25137
    else
        return 0;
    end
end




computeScore( x );