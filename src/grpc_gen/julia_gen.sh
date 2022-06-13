#!/bin/bash

OUTDIR=.
PROTO_DIR="milvus-proto/proto"

julia --project=/home/zhangyong/codes/Milvus/Project.toml -e 'using ProtoBuf; ProtoBuf.protoc(`-I=/home/zhangyong/codes/Milvus/src/grpc_gen/milvus-proto/proto --julia_out=/home/zhangyong/codes/Milvus/src/grpc_gen /home/zhangyong/codes/Milvus/src/grpc_gen/milvus-proto/proto/common.proto`)'

# python -m grpc_tools.protoc -I ${PROTO_DIR} --python_out=${OUTDIR}                              ${PROTO_DIR}/common.proto
# python -m grpc_tools.protoc -I ${PROTO_DIR} --python_out=${OUTDIR}                              ${PROTO_DIR}/schema.proto
# python -m grpc_tools.protoc -I ${PROTO_DIR} --python_out=${OUTDIR} --grpc_python_out=${OUTDIR}  ${PROTO_DIR}/milvus.proto

# sed -i 's/import common_pb2 as common__pb2/from . import common_pb2 as common__pb2/' $OUTDIR/*py
# sed -i 's/import schema_pb2 as schema__pb2/from . import schema_pb2 as schema__pb2/' $OUTDIR/*py
# sed -i 's/import milvus_pb2 as milvus__pb2/from . import milvus_pb2 as milvus__pb2/' $OUTDIR/*py

