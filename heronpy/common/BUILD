package(default_visibility = ["//visibility:public"])

load("/tools/rules/pex_rules", "pex_library")

pex_library(
    name = 'common-py',
    srcs = glob(['src/**/*.py']),
    deps = [
        '//heronpy/proto:proto-py',
        '//heronpy/api:heron-python-py',
    ],
    reqs = [
        'colorlog==2.6.1',
        'psutil==4.3.1',
    ]
)
