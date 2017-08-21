package(default_visibility = ["//visibility:public"])

genrule(
  name = "heron-downloader-target",
  srcs = [":heron-downloader.sh"],
  outs = ["heron-downloader"],
  cmd  = "cp $< $@",
)
