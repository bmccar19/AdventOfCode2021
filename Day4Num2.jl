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
    boardWins = 0;
    boardLoses = 0;
    boardLossInd = 0;

    for k = 1:numNumbers
        boardWins = 0;
        for i = 1:numBoards
            for j = 1:k
                diffBoard = diffBoard + ( M[i,:,:] .== x[j] )
            end
            chkRows = sum(diffBoard,dims=1);
            chkCols = sum(diffBoard,dims=2);

            for k = 1:5
                if ( chkRows[k] == 5 || chkCols[k] == 5 )
                    boardWins = boardWins + 1;
                    break;
                else
                    boardLossInd = i;
                end
            end
            

            diffBoard = zeros(Int64, 5,5 );
        end
    end

    return boardWins, boardLossInd;
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