#                ДОРАБОТАТЬ 1.1 b !!!!!!!!!
#СОРТИРОВКИ В 1.6 - 1.9 -> они реализованы в practic_2_2.jl

#-------------------1.1(a)-------------------#
function reverse_user!(a::Vector, start=1, stop=length(a))
    n = stop - start + 1
    for i in start : Int(round(n/2)) + start - 1
        a[i], a[stop-(i-start)] = a[stop-(i-start)], a[i]
    end
    return a
end

#-------------------1.2(a)-------------------#
function copy_user(a::Vector)
    n = length(a)
    b = Vector{eltype(A)}(undef, length(a))
    for i in 1 : n
        b[i] = a[i]
    end
    return b
end
#--------------------1.2(b)--------------------#
function copy_user(a::Matrix)
    b = similar(a)
    for i in 1 : size(a, 1)
        for j in 1 : size(a, 2)
            b[i,j] = a[i,j]
        end
    end
    return b
end

#-------------------1.3-------------------#

#--------------------a--------------------#
function bubblesort!(a)
    n = length(a)
    for k in 1:n-1
        istranspose = false
        for i in 1:n-k
            if a[i]>a[i+1]
                a[i], a[i+1] = a[i+1], a[i]
                istranspose = true
            end
        end
        if istranspose == false
            break
        end
    end
    return a
end

#--------------------b--------------------#
bubblesort(a)=bubblesort!(deepcopy(a))

#--------------------c--------------------#
function bubblesortperm!(a)
    n = length(a)
    indexes = collect(1:n)
    for k in 1:n-1
        istranspose = false
        for i in 1:n-k
            if a[i]>a[i+1]
                a[i],a[i+1]=a[i+1],a[i]
                indexes[i],indexes[i+1]=indexes[i+1],indexes[i]
                istranspose = true
            end
        end
        if istranspose == false
            break
        end
    end
    return indexes
end

#--------------------d--------------------#
bubblesortperm(a)=bubblesortperm!(deepcopy(a))

#-------------------1.4-------------------#
function sortItemMatrix!(a::Matrix)
    for j in 1 : size(a, 2)
        a[:,[j]] = bubblesort(a[:,[j]])
    end
    return a
end

#-------------------1.5-------------------#
function sortkey!(a::Vector, key_values::Vector)
    b = Vector{eltype(a)}(undef, length(key_values))
    for i in 1 : length(b)
        b[i] = a[key_values[i]]
    end

    b = bubblesort(b)

    for i in 1 : length(b)
        a[key_values[i]] = b[i]
    end

    return @view a[:, :]
end

#-------------------1.10-------------------#
function nummax(a)
    n = length(a)
    max = -Inf
    cnt = 0
    for i in 1 : n
        if a[i] > max
            max = a[i]
            cnt = 1
        elseif a[i] == max
            cnt += 1
        end
    end
    return cnt
end
#-------------------1.11-------------------#
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
    v = Vector{eltype(a)}(undef,nummax(a))
    n = length(a)
    max = maxvalue(a)
    j = 1

    for i in 1 : n
        if a[i] == max
            v[j] = i
            j += 1
        end
    end

    return v
end