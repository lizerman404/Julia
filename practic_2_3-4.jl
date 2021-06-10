#-------------------3/4.1-------------------#
function maxvalue(a)
    max = -Inf
    n = length(a)
    for i in 1 : n
        if a[i] > max
            max = a[i]
        end
    end
    return max
end

function findallmax(a)
    i_max = Array{Int, 1}()
    max = maxvalue(a)
    for i in 1 : length(a)
        if a[i] == max
            push!(i_max, i)
        end
    end
    return i_max
end
#-------------------3/4.3-------------------#
function shekerSort!(a)
    left = 1 
    right = length(a) # левая и правая границы сортируемой области массива
    flag = true  # флаг наличия перемещений
    # Выполнение цикла пока левая граница не сомкнётся с правой
    # и пока в массиве имеются перемещения
    while (left < right) && flag > 0
        flag = false
        for i in left : right - 1
            if a[i] > a[i+1] # если следующий элемент меньше текущего,
                # меняем их местами
                a[i], a[i+1] = a[i+1], a[i]
                flag = true    # перемещения в этом цикле были
            end
        end
        right -= 1 # сдвигаем правую границу на предыдущий элемент
        i = right
        while i > left #двигаемся справа налево
            if a[i-1] > a[i] # если предыдущий элемент больше текущего,
                # меняем их местами
                a[i], a[i-1] = a[i-1], a[i]
                flag = true   # перемещения в этом цикле были
            end
            i -= 1
        end
        left += 1 # сдвигаем левую границу на следующий элемент
    end
    return a
end
#-------------------3/4.4-------------------#
function shellsort!(a; distseries::Base.Generator=(length(a)÷2^i for i in 1:Int(floor(log2(length(a))))))
    for d in distseries
        for i in firstindex(a):lastindex(a)-d
            j=i
            while j>=firstindex(a) && a[j]>a[j+d]
                a[j],a[j+d] = a[j+d],a[j]
                j-=d
            end
        end
    end
    return a
end
#-------------------3/4.7-------------------#
function printArray(a)
    for i in eachindex(a) 
        println(a[i]) 
    end
end

function deleteat_user(a::Array, v::Array{Bool})
    new = []
    for i in 1 : length(v)
        if v[i] == true
            push!(new, a[i])
        end
    end
    return new
end

function insert_user!(a::Array, index::Int, item)
    push!(a, 0)
    for i in index : length(a)
        a[i], a[length(a)] = a[length(a)], a[i]
        println(i)
    end
    a[index] = item
    
    return a
end
#-------------------3/4.8-------------------#
#Проверка уникальности элемента в массиве
function check(a, value)::Bool
    cnt = 0
    for item in a
        if item == value
            cnt += 1
        end
    end
    if cnt == 1
        return true
    else
        return false
    end
end
function unique_user(a)
    #b = Array{eltype(a),ndims(a)}(undef,size(a))
    b = []
    for item in a
        if check(a, item) == true
            push!(b, item)
        elseif check(b, item) == false
            push!(b, item)
        end
    end
    return b
end

function allunique_user(a)::Bool
    flag = true
    for item in a
        if check(a, item) == false
            flag = false
            break
        end
    end
    return flag
end
#-------------------3/4.9-------------------#
function reverse_user!(a)
    stop = Int(round(length(a)/2))
    for i in 1 : stop - 1
        a[i], a[length(a)- i + 1] = a[length(a) - i + 1], a[i]
    end
    return a
end