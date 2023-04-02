workspace(name = "bazel-framework-test")

MEDIAPIPE_VERSION = "0.9.2.1"

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@bazel_skylib//lib:versions.bzl", "versions")

versions.check(minimum_bazel_version = "5.0.0")

http_archive(
    name = "com_google_absl",
    urls = [
        "https://github.com/abseil/abseil-cpp/archive/refs/tags/20230125.0.tar.gz",
    ],
    strip_prefix = "abseil-cpp-20210324.2",
    sha256 = "59b862f50e710277f8ede96f083a5bb8d7c9595376146838b9580be90374ee1f"
)

http_archive(
    name = "rules_cc",
    urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.6/rules_cc-0.0.6.tar.gz"],
    sha256 = "3d9e271e2876ba42e114c9b9bc51454e379cbf0ec9ef9d40e2ae4cec61a31b40",
    strip_prefix = "rules_cc-0.0.6",
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "2a4d07cd64b0719b39a7c12218a3e507672b82a97b98c6a89d38565894cf7c51",
    strip_prefix = "rules_foreign_cc-0.9.0",
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/refs/tags/0.9.0.tar.gz",
)

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

# This is used to select all contents of the archives for CMake-based packages to give CMake access to them.
all_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

# GoogleTest/GoogleMock framework. Used by most unit-tests.
# Last updated 2021-07-02.
http_archive(
    name = "com_google_googletest",
    urls = ["https://github.com/google/googletest/archive/4ec4cd23f486bf70efcc5d2caa40f24368f752e3.zip"],
    strip_prefix = "googletest-4ec4cd23f486bf70efcc5d2caa40f24368f752e3",
    sha256 = "de682ea824bfffba05b4e33b67431c247397d6175962534305136aa06f92e049",
)

# Google Benchmark library.
http_archive(
    name = "com_google_benchmark",
    urls = ["https://github.com/google/benchmark/archive/main.zip"],
    strip_prefix = "benchmark-main",
    build_file = "@com_github_mediapipe//third_party:benchmark.BUILD",
)

# gflags needed by glog
http_archive(
    name = "com_github_gflags_gflags",
    strip_prefix = "gflags-2.2.2",
    sha256 = "19713a36c9f32b33df59d1c79b4958434cb005b5b47dc5400a7a4b078111d9b5",
    url = "https://github.com/gflags/gflags/archive/v2.2.2.zip",
)

# 2020-08-21
http_archive(
    name = "com_github_glog_glog",
    strip_prefix = "glog-0a2e5931bd5ff22fd3bf8999eb8ce776f159cda6",
    sha256 = "58c9b3b6aaa4dd8b836c0fd8f65d0f941441fb95e27212c5eeb9979cfd3592ab",
    urls = [
        "https://github.com/google/glog/archive/0a2e5931bd5ff22fd3bf8999eb8ce776f159cda6.zip",
    ],
)
http_archive(
    name = "com_github_glog_glog_no_gflags",
    strip_prefix = "glog-0a2e5931bd5ff22fd3bf8999eb8ce776f159cda6",
    sha256 = "58c9b3b6aaa4dd8b836c0fd8f65d0f941441fb95e27212c5eeb9979cfd3592ab",
    build_file = "@com_github_mediapipe//third_party:glog_no_gflags.BUILD",
    urls = [
        "https://github.com/google/glog/archive/0a2e5931bd5ff22fd3bf8999eb8ce776f159cda6.zip",
    ],
    patches = [
        "@com_github_mediapipe//third_party:com_github_glog_glog_9779e5ea6ef59562b030248947f787d1256132ae.diff",
    ],
    patch_args = [
        "-p1",
    ],
)

# easyexif
http_archive(
    name = "easyexif",
    url = "https://github.com/mayanklahiri/easyexif/archive/master.zip",
    strip_prefix = "easyexif-master",
    build_file = "@com_github_mediapipe//third_party:easyexif.BUILD",
)

# libyuv
http_archive(
    name = "libyuv",
    # Error: operand type mismatch for `vbroadcastss' caused by commit 8a13626e42f7fdcf3a6acbb0316760ee54cda7d8.
    urls = ["https://chromium.googlesource.com/libyuv/libyuv/+archive/2525698acba9bf9b701ba6b4d9584291a1f62257.tar.gz"],
    build_file = "@com_github_mediapipe//third_party:libyuv.BUILD",
)

# Note: protobuf-javalite is no longer released as a separate download, it's included in the main Java download.
# ...but the Java download is currently broken, so we use the "source" download.
http_archive(
    name = "com_google_protobuf_javalite",
    sha256 = "87407cd28e7a9c95d9f61a098a53cf031109d451a7763e7dd1253abf8b4df422",
    strip_prefix = "protobuf-3.19.1",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.19.1.tar.gz"],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "87407cd28e7a9c95d9f61a098a53cf031109d451a7763e7dd1253abf8b4df422",
    strip_prefix = "protobuf-3.19.1",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.19.1.tar.gz"],
    patches = [
        "@com_github_mediapipe//third_party:com_google_protobuf_fixes.diff"
    ],
    patch_args = [
        "-p1",
    ],
)

http_archive(
    name = "com_google_audio_tools",
    strip_prefix = "multichannel-audio-tools-master",
    urls = ["https://github.com/google/multichannel-audio-tools/archive/master.zip"],
)

# 2020-07-09
http_archive(
  name = "pybind11_bazel",
  strip_prefix = "pybind11_bazel-fc56ce8a8b51e3dd941139d329b63ccfea1d304b",
  urls = ["https://github.com/pybind/pybind11_bazel/archive/fc56ce8a8b51e3dd941139d329b63ccfea1d304b.zip"],
)
# We still require the pybind library.
http_archive(
  name = "pybind11",
  build_file = "@pybind11_bazel//:pybind11.BUILD",
  strip_prefix = "pybind11-2.10.4",
  urls = ["https://github.com/pybind/pybind11/archive/v2.10.4.tar.gz"],
)

# Point to the commit that deprecates the usage of Eigen::MappedSparseMatrix.
http_archive(
    name = "ceres_solver",
    url = "https://github.com/ceres-solver/ceres-solver/archive/f68321e7de8929fbcdb95dd42877531e64f72f66.zip",
    strip_prefix = "ceres-solver-f68321e7de8929fbcdb95dd42877531e64f72f66",
    sha256 = "8b7b16ceb363420e0fd499576daf73fa338adb0b1449f58bea7862766baa1ac7"
)

http_archive(
    name = "opencv",
    build_file_content = all_content,
    strip_prefix = "opencv-4.3.0",
    urls = ["https://github.com/opencv/opencv/archive/4.3.0.zip"],
)

new_local_repository(
    name = "linux_opencv",
    build_file = "@com_github_mediapipe//third_party:opencv_linux.BUILD",
    path = "/usr",
)

new_local_repository(
    name = "linux_ffmpeg",
    build_file = "@com_github_mediapipe//third_party:ffmpeg_linux.BUILD",
    path = "/usr"
)

new_local_repository(
    name = "macos_opencv",
    build_file = "@com_github_mediapipe//third_party:opencv_macos.BUILD",
    path = "/usr/local/opt/opencv@3",
)

new_local_repository(
    name = "macos_ffmpeg",
    build_file = "@com_github_mediapipe//third_party:ffmpeg_macos.BUILD",
    path = "/usr/local/opt/ffmpeg",
)

new_local_repository(
    name = "windows_opencv",
    build_file = "@com_github_mediapipe//third_party:opencv_windows.BUILD",
    path = "C:\\opencv\\build",
)

http_archive(
    name = "android_opencv",
    build_file = "@com_github_mediapipe//third_party:opencv_android.BUILD",
    strip_prefix = "OpenCV-android-sdk",
    type = "zip",
    url = "https://github.com/opencv/opencv/releases/download/3.4.3/opencv-3.4.3-android-sdk.zip",
)

# After OpenCV 3.2.0, the pre-compiled opencv2.framework has google protobuf symbols, which will
# trigger duplicate symbol errors in the linking stage of building a mediapipe ios app.
# To get a higher version of OpenCV for iOS, opencv2.framework needs to be built from source with
# '-DBUILD_PROTOBUF=OFF -DBUILD_opencv_dnn=OFF'.
http_archive(
    name = "ios_opencv",
    sha256 = "7dd536d06f59e6e1156b546bd581523d8df92ce83440002885ec5abc06558de2",
    build_file = "@com_github_mediapipe//third_party:opencv_ios.BUILD",
    type = "zip",
    url = "https://github.com/opencv/opencv/releases/download/3.2.0/opencv-3.2.0-ios-framework.zip",
)

http_archive(
    name = "stblib",
    strip_prefix = "stb-b42009b3b9d4ca35bc703f5310eedc74f584be58",
    sha256 = "13a99ad430e930907f5611325ec384168a958bf7610e63e60e2fd8e7b7379610",
    urls = ["https://github.com/nothings/stb/archive/b42009b3b9d4ca35bc703f5310eedc74f584be58.tar.gz"],
    build_file = "@com_github_mediapipe//third_party:stblib.BUILD",
    patches = [
        "@com_github_mediapipe//third_party:stb_image_impl.diff"
    ],
    patch_args = [
        "-p1",
    ],
)

# iOS basic build deps.

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "9e26307516c4d5f2ad4aee90ac01eb8cd31f9b8d6ea93619fc64b3cbc81b0944",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/2.2.0/rules_apple.2.2.0.tar.gz",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "bf2861de6bf75115288468f340b0c4609cc99cc1ccc7668f0f71adfd853eedb3",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.7.1/rules_swift.1.7.1.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

git_repository(
    name = "build_bazel_rules_ios",
    remote = "https://github.com/bazel-ios/rules_ios.git",
    branch = "master",
)

load(
    "@build_bazel_rules_ios//rules:repositories.bzl",
    "rules_ios_dependencies"
)

rules_ios_dependencies()

# More iOS deps.

http_archive(
    name = "google_toolbox_for_mac",
    url = "https://github.com/google/google-toolbox-for-mac/archive/v3.0.0.zip",
    # sha256 = "e3ac053813c989a88703556df4dc4466e424e30d32108433ed6beaec76ba4fdc",
    strip_prefix = "google-toolbox-for-mac-3.0.0",
    build_file = "@com_github_mediapipe//third_party:google_toolbox_for_mac.BUILD",
)
