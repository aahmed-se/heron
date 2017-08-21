package(default_visibility = ["//visibility:public"])

load("/tools/rules/pex_rules", "pex_library", "pex_binary")

pex_library(
    name = "heron-network-py",
    srcs = glob(["**/*.py"]),
    deps = [
        "//heronpy/common:common-py",
        "//heronpy/proto:proto-py",
    ],
)
