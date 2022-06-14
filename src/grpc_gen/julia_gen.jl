using ProtoBuf
using gRPCClient
using Glob


function process_module()

    dir = "/home/zhangyong/codes/Milvus/src/grpc_gen/"
    proto_dir = joinpath(dir, "milvus-proto/proto/")

    # Output folder
    module_out_dir = joinpath(dir, "")

    # Input files
    infiles = glob("*.proto", proto_dir)

    includes_str = proto_dir   # ["--proto_path=$path" for path=includes]
    # run(ProtoBuf.protoc(`-I=$includes_str --plugin=protoc-gen-grpc --julia_out=$module_out_dir $infiles `))
    # run(ProtoBuf.protoc(`-I=$includes_str --plugin=protoc-gen-julia=/home/zhangyong/.julia/packages/ProtoBuf/A71jO/plugin/protoc-gen-julia --julia_out=$module_out_dir $infiles `))
    ProtoBuf.protoc(`-I=$includes_str --julia_out=$module_out_dir /home/zhangyong/codes/Milvus/src/grpc_gen/milvus-proto/proto/common.proto`)

end


function gen_jl()

    dir = "/home/zhangyong/codes/Milvus/src/grpc_gen/"
    proto_dir = joinpath(dir, "milvus-proto/proto/")

    trace_proto_file = joinpath(proto_dir, "common.proto")

    trace_dir = joinpath(dir, "")

    gRPCClient.generate(trace_proto_file; outdir = trace_dir, includes =[proto_dir])

end


process_module()
# gen_jl()



#=
2022.6.13
走不通,, 

可参考:
https://github.com/oolong-dev/OpenTelemetry.jl
https://github.com/oolong-dev/OpenTelemetry.jl/blob/master/src/proto/src/generated/OpentelemetryClients.jl

julia --project=/home/zhangyong/codes/Milvus/Project.toml /home/zhangyong/codes/Milvus/src/grpc_gen/julia_gen.jl

=#