using DistanceSimilarity, Test

function tests()
    @testset "tests" begin
        @test euclidean([2.0, 2.0], [2.0, 4.0]) == 2.0
        @test manhattan([2.0, 2.0], [2.0, 4.0]) == 2.0
        @test jaccard([2.0,2.0],[2.0,4.0]) == 0.5
        @test cosine([2.0,2.0],[2.0,4.0]) == 0.9486832980505138
    end
    @testset "Error tests" begin
        @test_throws MethodError euclidean([], [])
        @test_throws DimensionMismatch manhattan([1, 2, 3], [1, 2])
    end
end
tests()
