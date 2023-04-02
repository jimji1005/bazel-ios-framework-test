load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

filegroup(
    name = "Headers",
    srcs = [
        "TestFrameworkController.h"
    ],
    visibility = ["//:framework"],
)

objc_library(
    name = "TestFramework",
    srcs = [
        "TestFrameworkController.mm"
    ],
    hdrs = [
        "TestFrameworkController.h"
    ],
    module_name = "TestFramework",
    visibility = ["//:framework"],
    target_compatible_with = ["@platforms//os:macos"],
)

swift_library(
    name = "TestFrameworkProvider",
    srcs = [
        "TestFrameworkProvider.swift",
    ],
    module_name = "TestFrameworkProvider",
    visibility = ["//:framework"],
    deps = [
        "TestFramework"
    ]
)