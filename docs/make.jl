using ComplGinzLandEq
using Documenter

DocMeta.setdocmeta!(ComplGinzLandEq, :DocTestSetup, :(using ComplGinzLandEq); recursive=true)

makedocs(;
    modules=[ComplGinzLandEq],
    authors="Johannes Bosse <johannes.bosse@rwth-aachen.de>",
    repo="https://github.com/JohannesBosse/ComplGinzLandEq.jl/blob/{commit}{path}#{line}",
    sitename="ComplGinzLandEq.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Functions" => "functions.md"
    ],

    
)

deploydocs(
    repo = "github.com/jobosse/ComplGinzLandEq.jl",
)
