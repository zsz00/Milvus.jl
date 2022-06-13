

function process_module(input_path)
    # Include search paths
    includes   = [src_dir, src_dir/base_module]

    # Output folder
    module_out_dir    = out_dir/cur_module

    # Input files
    infiles = glob("*.proto", src_dir/input_path)

    mkpath(module_out_dir)
    includes_str=["--proto_path=$path" for path=includes]
    run(ProtoBuf.protoc(`$includes_str --julia_out=$module_out_dir $infiles`))

    ProtoBuf.protoc(`-I=/home/zhangyong/codes/Milvus/src/grpc_gen/milvus-proto/proto --julia_out=/home/zhangyong/codes/Milvus/src/grpc_gen /home/zhangyong/codes/Milvus/src/grpc_gen/milvus-proto/proto/common.proto`)


    nothing
end

