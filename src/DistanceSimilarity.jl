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
end #euclidean

function manhattan(x, y)

    if length(x) != length(y)
        throw(ArgumentError("The vectors must be the same size"))
    end

    valor = 0

    for i = 1:length(x)
        valor += norm(x[i] - y[i])
    end

    valor
end #manhattan

function jaccard(x, y)

    if length(x) != length(y)
        throw(ArgumentError("The vectors must be the same size"))
    end

    norm(length(intersect(x,y)) / length(union(x, y)))
end #jaccard

function cosine(x, y)

    if length(x) != length(y)
        throw(ArgumentError("The vectors must be the same size"))
    end

    scalar   = x .* y
    xSquared = x .^ 2
    ySquared = y .^ 2

    sum(scalar) / (sqrt(sum(xSquared)) * sqrt(sum(ySquared)))
end #cosine

end # module
