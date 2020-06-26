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

    valor1, valor2, valor3 = 0, 0, 0
    scalar, xSquared, ySquared  = x .* y, x .^ 2, y .^ 2

    for i = 1:length(x)
        valor1 += scalar[i]
        valor2 += xSquared[i]
        valor3 += ySquared[i]
    end
    valor1/(sqrt(valor2)*sqrt(valor3))
end
x = [3, 0]
y = [0, 3]

end # module
