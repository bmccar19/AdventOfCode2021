

x = readlines( "C:\\Users\\Brian\\Documents\\AdventOfCode2021\\inputs\\day1input.txt" );

v = parse.(Int64, x)

a = v[2:end]-v[1:end-1]

let ctr = 0
    for i = 1:length(a)
        if a[i] > 0
            ctr = ctr + 1;
        end
    end
    ctr
end





