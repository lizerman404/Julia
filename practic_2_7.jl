#-------------------7.1-------------------#
function quickPow(x, n::Integer)
    count = 1
    if (n == 0) 
        return 1
    end
    while (n != 0)
        if (n % 2 == 0)
            n /= 2
            x *= x
        else
            n -= 1
            count *= x
        end
    end
    return count
end
#-------------------7.4-------------------#
function isPrime(a::Integer)
    flag = true
    for i in 2 : sqrt(a)
        if a % i == 0
            flag = false
            break
        end
    end
    return flag
end
#-------------------7.5-------------------#
function eratosphen(val::Int)
    a = Vector{Int}()
    b = Vector{Int}()
    for i in 1 : val
        push!(a, i)
    end
    for p in 2 : val
        if a[p] != 0
            push!(b, a[p])
            j = p*p
            while j < val + 1
                a[j] = 0
                j += p
            end
        end
    end
    return b
end
#-------------------7.6-------------------#
function EulerFunction(n::Integer)
    result = n
    for i in 2 : sqrt(n)
        if n % i == 0
            while n % i == 0
                n /= i
            end
            result -= result / i
        end
    end
    if n > 1
        result -= result / n
    end
    return result
end
#-------------------7.7-------------------#
function gcd_user(a::Integer, b::Integer, x = 1, y = 1) 
	if a == 0
		x = 0
        y = 1
		return b
    end
	x1 = []
    y1 = []
	d = gcd_user(b%a, a, x1, y1)
	x = y1 - (b / a) * x1
	y = x1
	return d
end