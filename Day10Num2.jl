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

function findExtraChars( x )
    elements = split(x,"");
    elType = zeros(Int32, length(elements));
    idx = 0;

    strExtra = "";
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
            if ( (i+k-1) == length(elements ) && bracketCount != 0)

                strExtra = getOppositeBracket( elements[i] ) * strExtra;

            end
        end

    end

    return strExtra;


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

function getOppositeBracket( element )
    if element == "{"
        return "}";
    elseif element == "("
        return ")";
    elseif element == "["
        return "]";
    elseif element == "<"
        return ">";
    elseif element == ">"
        return "<";
    elseif element == "]"
        return "[";
    elseif element == ")"
        return "(";
    elseif element == "}"
        return "{";
    end
    
end

function computeScore( lines )

    scores = Int64[];
    for i = 1:length(lines)
        
        thisString = findExtraChars( lines[i] )
        if findWrongBrackInLine( lines[i] ) == 0 
            append!(scores, getLineScore( thisString ));            
        end
        
        
    end

    sortedScores = sort(scores);

    return sortedScores;
end


function getLineScore( elements )
    score = 0;
    elArray = split(elements, "");

    for i = 1:length(elArray )
        if ( elArray[i] =="]")
            elScore = 2;
        elseif elArray[i] == ")"
            elScore = 1;
        elseif elArray[i] == "}"
            elScore = 3;
        elseif elArray[i] == ">"
            elScore = 4;
        end

        score = 5*score + elScore;
    end

    return score;
end




f = computeScore( x )