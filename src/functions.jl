using DifferentialEquations, Logging, Plots
include("code.jl")

"""
    CGLE(g::Grid2D, u0::AbstractArray; tspan = (0.,15.), α=2., β=-1.)

Solves the complex Ginsburg Landau differential differential equation.

# Arguments

* 'g::Grid2D'
* 'u0::AbstractArray'

## key word arguments

* tspan = (0.,15.)
* α=2.
* β=-1.
"""
function CGLE(g::Grid2D, u0::AbstractArray; tspan = (0.,15.), α=2., β=-1.)
    if !(size(g.y_grid) == size(u0))
        @error "The grid g and the initial conditions are not compatible due to different sizes"
    end

    Δ = Laplacian2D(g)
    u0 = reshape(u0, :) 
    function f!(du,u,p,t)
        α, β = p
        du .= (1+(α)im) .* Δ(u) - (1 +(β)im) * u'*u .* u
    end

    prob = ODEProblem(f!, u0, tspan, [α, β])
    sol = solve(prob)
    return sol
end

"""
    animateSol(sol)

Animates the solution of a 2D DifferentialEquation

# Arguments

* sol, DifferentialEquations.sol() object
* name::String, optional, default name= "CGLE"
"""
function animateSol(sol; name="CGLE")
    tspan = sol.t[1]:0.1:sol.t[end]
    n = Int(sqrt(length(sol.u[1,:][1])))

    anim = Plots.@animate for t ∈ tspan
        Plots.heatmap(reshape(real.(sol(t)),n,n),clims=(0 ,1))
    end
    
    gif(anim, name * ".gif",fps=10)
end

function CGLEDemo(;L=75, n=50)
    u0 = 0.01*(rand(ComplexF64, (n,n)) .- (0.5 + 0.5im))
    g = Grid2D(range(0,L,length=n),range(0,L,length=n))
    sol = CGLE(g,u0)
    animateSol(sol)
end