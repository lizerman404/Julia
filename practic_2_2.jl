#-------------------2.2-------------------#
function bubblesort!(a, f::Function = f(x) = x)
    n = length(a)
    for k in 1 : n-1
        istranspose = false
        for i in 1:n-k
            if f.(a)[i] > f.(a)[i+1]
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

function sum(a)
    sum = 0
    for i in a
        sum += i
    end
    return sum
end

function numzero(a)
    cnt = 0
    for i in a
        if i == 0
            cnt += 1
        end
    end
    return cnt
end

function sortColonsOfMatrix!(a::Matrix, f::Function)
    # Вектор столбцов в а
    vec_of_colons=[@view a[:,j] for j in 1:size(a,2)]
    
    vec_of_colons = bubblesort!(vec_of_colons, f)

    # Используем горизонтальную конкатенацию с заменой значений
    a = hcat(vec_of_colons...)
    return a
end

#-------------------2.3-------------------#
function printArray(a)
    for i in eachindex(a) 
        println(a[i]) 
    end
end

function calcsort!(a::Vector, start::Int, stop::Int)
    # Вектор для хранения количества повторений элементов ветора а
    v = Vector{eltype(a)}(undef, stop - start + 1)
    # Обнуляем его
    v = Int.(zeros(length(v))
    # Подсчитываем количество всех значений в векторе а
    for i in 1 : length(a)
        v[a[i] - start + 1] += 1
    end

    # Следит за индексом замены значения в а
    ptr = 0
    
    # Заменяем все значения а на новые отсортированные
    for i in 1 : length(v)
        for j in 1 : v[i]
            a[ptr + j] = i + start - 1
        end
        ptr += v[i]
    end
    return a
end

# Возвращает индекс вектора по значению
function index(value, k::Vector)
    indx = Int(0)
    for i in 1 : length(k)
        indx = i
        if k[i] == value
            break
        end
    end
    return indx
end

function calcsort!(a::Vector, k::Vector)
    # Вектор для хранения количества повторений элементов ветора а
    v = Vector{eltype(a)}(undef, length(k))
    # Обнуляем его
    v = Int.(zeros(length(v)))
    # Подсчитываем количество всех значений в векторе а
    for i in 1 : length(a)
        v[index(a[i], k)] += 1
    end

    # Следит за индексом замены значения в а
    ptr = 0
    
    # Заменяем все значения а на новые отсортированные
    for i in 1 : length(v)
        for j in 1 : v[i]
            a[ptr + j] = k[i]
        end
        ptr += v[i]
    end
    return a
end

#-------------------2.4-------------------#
function calcsortMatrix!(a::Matrix)
    # Вектор столбцов в а
    vec_of_colons=[@view a[:,j] for j in 1:size(a,2)]
    # Вектор, который хранит уникальные столбцы из а
    k = Vector{eltype(vec_of_colons)}(undef, 0)
    # Добавляем первый столбец, так как он априори уникальный
    push!(k, vec_of_colons[1])

    # Формируем вектор уникальных столбцов
    for i in 1 : length(vec_of_colons)
        flag = true
        for j in 1 : length(k)
            if k[j] == vec_of_colons[i]
                flag = false
                break
            end
        end
        if flag == true
            push!(k, vec_of_colons[i])
        end
    end

    # Сортируем его, чтобы воспользоваться функцией calcsort
    k = bubblesort!(k, numzero)

    calcsort!(vec_of_colons, k)

    # Используем горизонтальную конкатенацию с заменой значений
    a = hcat(vec_of_colons...) 
    return a
end