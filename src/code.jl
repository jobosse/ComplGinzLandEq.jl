using LinearAlgebra
using SparseArrays
 
"""
# Initialization 

    Grid2D(x::AbstractRange, y::AbstractRange)


# Fields 

* x # this is a n_x long range
* y
* h_x
* h_y
* n, number of grid points along one side
* N, total number of grid points 
* x_grid, this is a n_x x n_y matrix 
* y_grid
"""
struct Grid2D 
    x # this is a n_x long range
    y
    h_x
    h_y
    n # number of grid points along one side
    N # total number of grid points 
    x_grid # this is a n_x x n_y matrix 
    y_grid
end 

function Grid2D(x::AbstractRange, y::AbstractRange)
    h_x = abs(x[2] - x[1])
    h_y = abs(y[2] - y[1])
    n_x = length(x)
    n_y = length(y)
    @assert n_x == n_y
    
    N = n_x * n_y 
    x_grid = ones(n_x) * x'
    y_grid = y * ones(n_y)'
    
    Grid2D(x, y, h_x, h_y, n_x, N, x_grid, y_grid)
end 

"""
# Initialization 

    Laplacian2D(g::Grid2D)

    2D Laplacian
"""
struct Laplacian2D 
    M 
end 
 
function Laplacian2D(g::Grid2D)
    n = g.n
    N = g.N 
    
    # these are the neighbours in x-direction
    # however this will include points that are not actually neighbours in the grid (n,n+1),(n+1,n)
    # we thus will manually delete those form the array and replace them with the correct neighours 
    # at the left and right boundary in the end 
    M = diagm(0=>-4*ones(N), 1=>ones(N-1), -1=>ones(N-1))
    for i=1:(n-1) 
        M[i*n,i*n + 1] = 0
        M[i*n + 1,i*n] = 0
    end

    # these are the neighbours in y-direction
    M += diagm(n=>ones(N-n), -n=>ones(N-n))

    # these are the neighours of the grid points at the upper boundary
    M += diagm(N-n => ones(n))

    # these are the neighbours of the grid points at the lower boundary 
    M += diagm(-N+n => ones(n))
    
    for i=1:n:N # loop over left and right boundary points
       M[i,i+(n-1)] = 1
       M[i+(n-1),i] = 1
    end 

    Laplacian2D(sparse(M./(g.h_x^2)))
end
 
 (Δ::Laplacian2D)(x) = Δ.M * x