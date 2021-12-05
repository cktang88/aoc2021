using DelimitedFiles

arr = readdlm("./4.txt", skipblanks=true)

function solve()
    pulls = map(x -> parse(Int, x), split(arr[1], ","))
    boards = []
    for i in range(2, size(arr, 1) - 1, step=5)
        push!(boards, arr[i:i + 4, :])
    end

    lastboard = nothing
    for num in pulls
        for b in boards
            mark!(b, num)
            # if check(b)
            #     println("Done: ", sum_remaining(b) * num)
            #     return
            # end
        end

        # part 2
        # boards = filter(b -> !check(b), boards)
        deleteat!(boards, findall(b -> check(b), boards))

        if length(boards) == 1
            lastboard = boards[1]
        elseif isempty(boards)
            mark!(lastboard, num)
            println("Done: ", num, " ", sum_remaining(lastboard) * num)
            break
        end
    end
end

@inline sum_remaining(board) = sum(filter(x ->  x > -1, board))
@inline allmarked(iter) = all(map(x -> x == -1, iter))
@inline check(board) = any(allmarked(board[i, :]) || allmarked(board[:, i]) for i = 1:5)
function mark!(board, num::Int)
    ind = findfirst(e -> e == num, board)
    if !=(ind, nothing)
        board[ind] = -1
    end
end

@time solve()
