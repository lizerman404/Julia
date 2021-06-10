#-------------------6.1-------------------#
function merge_user(a::Array, b::Array)
    c = Array{eltype(a)}(undef,length(a) + length(b))
    for i in 1 : length(a)
        c[i] = a[i]
    end
    for i in length(a) + 1 : length(c)
        c[i] = b[i - length(a)]
    end
    sort!(c)
    return c
end
#-------------------6.2-------------------#
function partSort!(a::Array, val)
    a1 = []
    a2 = []
    a3 = []
    for i in 1 : length(a)
        if a[i] < val
            push!(a1, a[i])
        elseif a[i] == val
            push!(a2, a[i])
        else
            push!(a3, a[i])
        end
    end
    for i in 1 : length(a1)
        a[i] = a1[i]
    end
    for i in length(a1) + 1 : length(a1) + length(a2)
        a[i] = a2[i - length(a1)]
    end
    for i in length(a1) + length(a2) + 1 : length(a1) + length(a2) + length(a3)
        a[i] = a3[i - length(a1) - length(a2)]
    end
    return a
end
#-------------------6.3-------------------#
function partSort2!(a::Array, val)
    a1 = []
    a2 = []
    for i in 1 : length(a)
        if a[i] <= val
            push!(a1, a[i])
        else
            push!(a2, a[i])
        end
    end
    for i in 1 : length(a1)
        a[i] = a1[i]
    end
    for i in length(a1) + 1 : length(a1) + length(a2)
        a[i] = a2[i - length(a1)]
    end
    return a
end
