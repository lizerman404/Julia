#-------------------3.1-------------------#
function transpose_user!(a::Matrix)
    for j in 1 : size(a, 2)
        for i in j : size(a, 1)
            a[i,j], a[j,i] = a[j,i], a[i,j]
        end
    end
    return a
end

#-------------------3.2-------------------#
function indperm!(a::Array, indx::Vector)
    ptr = 1
    for i in 1 : length(indx)
        a[i], a[indx[i]] = a[indx[i]], a[i]
    end
    return a
end