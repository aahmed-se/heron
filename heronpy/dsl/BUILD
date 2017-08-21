package(default_visibility = ["//visibility:public"])

load("/tools/rules/pex_rules", "pex_library", "pex_binary")

pex_library(
    name = "heron-pythondsl-py",
    srcs = glob(["src/**/*.py"]),
    deps = [
        "//heronpy/api:heron-python-py",
    ],
)

# for egg production
pex_binary(
    name = "heron-pythondsl-package",
    srcs = glob(["src/**/*.py"]),
    deps = [
        ":heron-pythondsl-py",
        "//heronpy/api:heron-python-py",
    ]
)
