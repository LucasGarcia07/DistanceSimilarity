module DistanceSimilarity
import LinearAlgebra:norm
function euclidean(x, y)
    if length(x) != length(y)
        throw(ArgumentError("The vectors must be the same size"))
    end
    valor = 0
    for i = 1:length(x)
        valor += (x[i] - y[i])^2
    end
    sqrt(valor)
end

function manhattan(x, y)
    if length(x) != length(y)
        throw(ArgumentError("The vectors must be the same size"))
    end

    valor = 0

    for i = 1:length(x)
        valor += norm(x[i] - y[i])
    end
    valor
end

function jaccard(x, y)
    if length(x) != length(y)
        throw(ArgumentError("The vectors must be the same size"))
    end

    norm(length(intersect(x,y)) / length(union(x, y)))
end

function cosine(x, y)
    if length(x) != length(y)
        throw(ArgumentError("The vectors must be the same size"))
    end
    scalar, xSquared, ySquared  = x .* y, x .^ 2, y .^ 2
    sum(scalar)/(sqrt(sum(xSquared))*sqrt(sum(ySquared)))
end # module
