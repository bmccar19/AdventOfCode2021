x = readlines( ".\\inputs\\day4input.txt" );


numstr = split(x[1], ",")
nums = parse.(Int64, numstr)

function parseBoards( x )
    
    numBoards = div(( length(x) - 1 ),6);
    k = 3;
    M = zeros(Int64,numBoards,5,5);
    for i = 1:numBoards
        for j = 1:5
            M[i,j,1:5] = parse.(Int64,split(x[k]));
            k = k + 1;
        end
        k = k + 1;
    end
    return M;

end

M = parseBoards(x)

function findBingoBoard( x, M )

    numBoards = length(M[:,1,1]);
    numNumbers = length(x);
    chkNone = 0;
    diffBoard = zeros(Int64, 5,5 );

    for i = 1:numBoards
        for j = 1:numNumbers
            diffBoard = diffBoard + ( M[i,:,:] .== x[j] )
        end


        chkRows = sum(diffBoard,dims=1);
        chkCols = sum(diffBoard,dims=2);

        for k = 1:5
            if ( chkRows[k] == 5 )
                return i;
                chkNone = 1;
                break;
            end
            if ( chkCols[k] == 5 )
                return i;
                chkNone = 1;
                break;
            end
        end
    

        diffBoard = zeros(Int64, 5,5 );

        if chkNone == 1
            break;
        end
    end

    if chkNone == 0 
        return 0;
    end

end


boardIdx = findBingoBoard( nums[1:34], M )

function sumUnusedNumbers( x, M )
    
    numNumbers = length(x);
    diffBoard = zeros(Int64, 5,5 );
    sumNums = 0;
    
    for j = 1:numNumbers
        diffBoard = diffBoard + ( M .== x[j] )
    end

    for i = 1:5
        for k = 1:5
            if ( diffBoard[i,k] != 1 )
                sumNums = sumNums + M[i,k];
            end
        end
    end
    return sumNums;
end