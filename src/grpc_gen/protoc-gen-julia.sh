#!/bin/bash

FLAGS=""

if [ -z "$JULIA" ]
then
    JULIA=julia
fi

if [ ${JULIA_PROTOBUF_MODULE_POSTFIX:-0} -eq 1 ]; then
    FLAGS="${FLAGS} --module-postfix-enabled"
fi

if [ ${JULIA_PROTOBUF_MAP_AS_ARRAY:-0} -eq 1 ]; then
    FLAGS="${FLAGS} --map-as-array"
fi

if [ ${JULIA_PROTOBUF_DEBUG:-0} -eq 1 ]; then
    FLAGS="${FLAGS} --debug-gen"
fi

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
echo ${SCRIPT_DIR}/../..
JULIA_GEN="${JULIA} ${COVERAGE} --project=${SCRIPT_DIR}/../.. -e 'using ProtoBuf; using ProtoBuf.Gen; gen()'"
if [ -z "${FLAGS}" ]
then
    eval " ${JULIA_GEN}"
else
    eval " ${JULIA_GEN} -- ${FLAGS}"
fi
