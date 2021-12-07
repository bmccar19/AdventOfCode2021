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

    for i = 1:numBoards
        for j = 1:numNumbers
            diffBoard = M[i,:,:] .- x[j];
            chkRows = sum(diffBoard,dims=1);
            chkCols = sum(diffBoard,dims=2);

            if ( sum( chkRows .== 1 ) == 5 )
                return i;
                break;
            end
            if ( sum( chkCols .== 1 ) == 5 )
                return i;
                break;
            end
        end
    end

    return 0;

end
