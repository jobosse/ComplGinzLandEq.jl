var documenterSearchIndex = {"docs":
[{"location":"functions/","page":"Functions","title":"Functions","text":"CurrentModule = ComplGinzLandEq","category":"page"},{"location":"functions/#Functions","page":"Functions","title":"Functions","text":"","category":"section"},{"location":"functions/","page":"Functions","title":"Functions","text":"Documentation for ComplGinzLandEq.","category":"page"},{"location":"functions/","page":"Functions","title":"Functions","text":"Modules = [ComplGinzLandEq]","category":"page"},{"location":"functions/#ComplGinzLandEq.Grid2D","page":"Functions","title":"ComplGinzLandEq.Grid2D","text":"Initialization\n\nGrid2D(x::AbstractRange, y::AbstractRange)\n\nFields\n\nx # this is a n_x long range\ny\nh_x\nh_y\nn, number of grid points along one side\nN, total number of grid points \nxgrid, this is a nx x n_y matrix \ny_grid\n\n\n\n\n\n","category":"type"},{"location":"functions/#ComplGinzLandEq.Laplacian2D","page":"Functions","title":"ComplGinzLandEq.Laplacian2D","text":"Initialization\n\nLaplacian2D(g::Grid2D)\n\n2D Laplacian\n\n\n\n\n\n","category":"type"},{"location":"functions/#ComplGinzLandEq.CGLE-Tuple{ComplGinzLandEq.Grid2D, AbstractArray}","page":"Functions","title":"ComplGinzLandEq.CGLE","text":"CGLE(g::Grid2D, u0::AbstractArray; tspan = (0.,15.), α=2., β=-1.)\n\nSolves the complex Ginsburg Landau differential differential equation.\n\nArguments\n\n'g::Grid2D'\n'u0::AbstractArray'\n\nkey word arguments\n\ntspan = (0.,15.)\nα=2.\nβ=-1.\n\nTest change\n\n\n\n\n\n","category":"method"},{"location":"functions/#ComplGinzLandEq.animateSol-Tuple{Any}","page":"Functions","title":"ComplGinzLandEq.animateSol","text":"animateSol(sol)\n\nAnimates the solution of a 2D DifferentialEquation\n\nArguments\n\nsol, DifferentialEquations.sol() object\nname::String, optional, default name= \"CGLE\"\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = ComplGinzLandEq","category":"page"},{"location":"#ComplGinzLandEq","page":"Home","title":"ComplGinzLandEq","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for ComplGinzLandEq.","category":"page"},{"location":"","page":"Home","title":"Home","text":"This is the home of documentation.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [ComplGinzLandEq]","category":"page"}]
}
