package(default_visibility = ["//visibility:public"])

load("/tools/rules/genproto",  "proto_library")
load("/tools/rules/pex_rules", "pex_library", "pex_binary")

pex_library(
    name = "proto-py",
    deps = [
        "//heron/proto:proto_common_py",
        "//heron/proto:proto_execution_state_py",
        "//heron/proto:proto_stats_py",
        "//heron/proto:proto_topology_py",
        "//heron/proto:proto_scheduler_py",
        "//heron/proto:proto_packing_plan_py",
        "//heron/proto:proto_physical_plan_py",
        "//heron/proto:proto_metrics_py",
        "//heron/proto:proto_tmaster_py",
        "//heron/proto:proto_tuple_py",
        "//heron/proto:proto_stmgr_py",
        "//heron/proto:proto_ckptmgr_py",
    ],
    reqs = [
        "protobuf==2.5.0",
        "setuptools==18.0.1",
    ],
)

# for egg production
pex_binary(
    name = "proto-py-package",
    srcs = glob(["**/*.py"]),
    deps = [
        ":proto-py",
    ]
)