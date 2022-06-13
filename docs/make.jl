using Milvus
using Documenter

DocMeta.setdocmeta!(Milvus, :DocTestSetup, :(using Milvus); recursive=true)

makedocs(;
    modules=[Milvus],
    authors="zsz00 <zsz6174@gmail.com> and contributors",
    repo="https://github.com/zsz00/Milvus.jl/blob/{commit}{path}#{line}",
    sitename="Milvus.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://zsz00.github.io/Milvus.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/zsz00/Milvus.jl",
    devbranch="main",
)
