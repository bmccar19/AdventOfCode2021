x = readlines( "C:\\Users\\Brian\\Documents\\AdventOfCode2021\\inputs\\day1input.txt" );
v = parse.(Int64, x)

f(x, ind) = x[ind] + x[ind+1] + x[ind+2]

val = zeros(length(v)-2)

for i = 1:length(v)-2
    val[i] = f(v, i)
end

sVal = sign.(val[2:end]-val[1:end-1])
answer = sum(sVal .>0.0)
