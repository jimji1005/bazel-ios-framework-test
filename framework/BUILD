load("@build_bazel_rules_apple//apple:ios.bzl", "ios_framework")
load("@build_bazel_rules_ios//rules:framework.bzl", "apple_framework_packaging")

MIN_IOS_VERSION = "14.0"

apple_framework_packaging(
    name = "DataProviderFramework",
    framework_name = "DataProvider",
    visibility = ["//visibility:public"],
    transitive_deps = [
        "//framework/objc:TestFramework",
    ],
    deps = [
        "//framework/swift:TestFrameworkProvider",
    ],
)

genrule(
    name = "PatchedTestFramework",
    srcs = [":TestFramework"],
    outs = [
        "TestFramework.framework",
        "TestFramework.framework.dSYM",
    ],
    output_to_bindir = 1,
    tools = ["patch_ios_framework.sh"],
    cmd = """
        bash $(location patch_ios_framework.sh) "$(SRCS)" "$(OUTS)"
    """
)

ios_framework(
    name = "TestFramework",
    bundle_id = "com.lotuslabs.test",
    hdrs = [
        "//framework/objc:Headers",
        "headers/TestFramework.h",
    ],
    families = [
        "iphone",
        "ipad",
    ],
    resources = [
        "modulemap/module.modulemap"
    ],
    infoplists = ["Info.plist"],
    minimum_os_version = MIN_IOS_VERSION,
    visibility = ["//visibility:public"],
    deps = [
        "//framework/objc:TestFramework",
    ],
)