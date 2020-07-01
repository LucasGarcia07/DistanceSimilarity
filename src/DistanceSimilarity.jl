module DistanceSimilarity

import LinearAlgebra:norm

export euclidean, manhattan, cosine, jaccard

"""
checkInput checks if arrays have the same length and if they aren't empty
"""
function checkInput(arr1::AbstractArray, arr2::AbstractArray)

    if length(arr1) != length(arr2)
        throw(DimensionMismatch("Arrays must have the same length"))
    end

    if isempty(arr1) | isempty(arr2)
        throw(DimensionMismatch("Arrays can't be empty"))
    end
end



"""
euclidean receive 2 1-D arrays and returns the euclidean distance(float)
between the arrays

    Example:
        array1 = [1, 2, 3]
        array2 = [2, 1, 3]
        euclidean(array1, array2)
"""
function euclidean(arr1::AbstractArray, arr2::AbstractArray)

    checkInput(arr1, arr2)

    sqrt(sum((arr1 - arr2) .^ 2))

end

"""
manhattan receive 2 1-D vectors and returns the manhattan distance(float)
between the arrays

    Example:
        array1 = [1, 2, 3]
        array2 = [2, 1, 3]
        manhattan(array1, array2)
"""

function manhattan(arr1::AbstractArray, arr2::AbstractArray)

    checkInput(arr1, arr2)

    sum(norm(arr1 - arr2))

end #manhattan


"""
jaccard receive 2 1-D arrays and returns the jaccard similarity (float)
between the arrays

    Example:
        array1 = [1, 2, 3]
        array2 = [2, 1, 3]
        jaccard(array1, array2)
"""

function jaccard(arr1::AbstractArray, arr2::AbstractArray)

    checkInput(arr1, arr2)

    norm(length(intersect(arr1,arr2)) / length(union(arr1, arr2)))

end #jaccard

"""
Cosine function receive 2 1-D vectors and returns the cosine similarity(float)
between the arrays
    Example:
        array1 = [1, 2, 3]
        array2 = [2, 1, 3]
        cosine(array1, array2)
"""

function cosine(arr1::AbstractArray, arr2::AbstractArray)

    checkInput(arr1, arr2)

    scalar   = arr1 .* arr2
    xSquared = arr1 .^ 2
    ySquared = arr2 .^ 2

    sum(scalar) / (sqrt(sum(xSquared)) * sqrt(sum(ySquared)))
end #cosine



end # module
