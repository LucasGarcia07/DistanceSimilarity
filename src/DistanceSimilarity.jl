module DistanceSimilarity

import LinearAlgebra:norm

export cosine, checkInput, euclidean, manhattan, jaccard

"""
checkInput(arr1::AbstractArray, arr2::AbstractArray)

Checks if arrays have the same length
"""
function checkInput(arr1::AbstractArray{T, 1}, arr2::AbstractArray{T, 1})where T<:Number

    if length(arr1) != length(arr2)
        throw(DimensionMismatch("Arrays must have the same length"))
    end

end

"""
euclidean(arr1::AbstractArray, arr2::AbstractArray)

Returns the euclidean distance between the arrays

    Example:
        array1 = [1, 2, 3]
        array2 = [2, 1, 3]
        euclidean(array1, array2)
"""
function euclidean(arr1::AbstractArray{T, 1}, arr2::AbstractArray{T, 1}) where T<:Number

    checkInput(arr1, arr2)

    sqrt(sum((arr1 - arr2) .^ 2))

end

"""
manhattan(arr1::AbstractArray, arr2::AbstractArray)

Returns the manhattan distance between the arrays

    Example:
        array1 = [1, 2, 3]
        array2 = [2, 1, 3]
        manhattan(array1, array2)
"""

function manhattan(arr1::AbstractArray{T, 1}, arr2::AbstractArray{T, 1}) where T<:Number

    checkInput(arr1, arr2)

    sum(norm(arr1 - arr2))

end


"""
jaccard(arr1::AbstractArray, arr2::AbstractArray)

Returns the jaccard similarity between the arrays

    Example:
        array1 = [1, 2, 3]
        array2 = [2, 1, 3]
        jaccard(array1, array2)
"""

function jaccard(arr1::AbstractArray{T, 1}, arr2::AbstractArray{T, 1}) where T<:Number

    checkInput(arr1, arr2)

    norm(length(intersect(arr1,arr2)) / length(union(arr1, arr2)))

end

"""
cosine(arr1::AbstractArray, arr2::AbstractArray)

Returns the cosine similarity between the arrays
    Example:
        array1 = [1, 2, 3]
        array2 = [2, 1, 3]
        cosine(array1, array2)
"""

function cosine(arr1::AbstractArray{T, 1}, arr2::AbstractArray{T, 1}) where T<:Number

    checkInput(arr1, arr2)

    scalar   = arr1 .* arr2
    xSquared = arr1 .^ 2
    ySquared = arr2 .^ 2

    sum(scalar) / (sqrt(sum(xSquared)) * sqrt(sum(ySquared)))
end

end
