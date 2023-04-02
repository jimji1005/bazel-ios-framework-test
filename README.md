# bazel-ios-framework-test
Repdocution of `error: 'UIKit/UIKit.h' file not found`

## Building objc
Run with `bazel build --config=ios_simulator framework/objc:TestFramework`
Builds fine with out issues

## Building swift
Run with ``bazel build --config=ios_simulator framework/objc:TestFrameworkProvider`
Build fails with 
```
INFO: Analyzed target //framework/objc:TestFrameworkProvider (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
ERROR: /Users/jimji/Code/bazel-swift-objective-c-framework/framework/objc/BUILD:24:14: Compiling Swift module //framework/objc:TestFrameworkProvider failed: (Exit 1): worker failed: error executing command (from target //framework/objc:TestFrameworkProvider) 
  (cd /private/var/tmp/_bazel_jimji/a011e649c4aef6bee0e4fd7e702d6135/execroot/bazel-framework-test && \
  exec env - \
    APPLE_SDK_PLATFORM=MacOSX \
    APPLE_SDK_VERSION_OVERRIDE=13.1 \
    SWIFT_AVOID_WARNING_USING_OLD_DRIVER=1 \
    XCODE_VERSION_OVERRIDE=14.2.0.14C18 \
  bazel-out/darwin_arm64-opt-exec-2B5CBBC6/bin/external/build_bazel_rules_swift/tools/worker/worker swiftc @bazel-out/darwin_arm64-fastbuild/bin/framework/objc/TestFrameworkProvider.swiftmodule-0.params)
# Configuration: 913265144afa5073ab2925a40f47c1b06b3e702fb3af6e4203d81054e02d7a5d
# Execution platform: @local_config_platform//:host
error: emit-module command failed with exit code 1 (use -v to see invocation)
<module-includes>:1:9: note: in file included from <module-includes>:1:
#import "../../../../../framework/objc/TestFrameworkController.h"
        ^
/private/var/tmp/_bazel_jimji/a011e649c4aef6bee0e4fd7e702d6135/execroot/bazel-framework-test/bazel-out/applebin_ios-ios_x86_64-fastbuild-ST-5557854aa1ac/bin/framework/objc/../../../../../framework/objc/TestFrameworkController.h:2:9: error: 'UIKit/UIKit.h' file not found
#import <UIKit/UIKit.h>
        ^
framework/objc/TestFrameworkProvider.swift:3:8: error: could not build Objective-C module 'TestFramework'
import TestFramework
       ^
<module-includes>:1:9: note: in file included from <module-includes>:1:
#import "../../../../../framework/objc/TestFrameworkController.h"
        ^
/private/var/tmp/_bazel_jimji/a011e649c4aef6bee0e4fd7e702d6135/execroot/bazel-framework-test/bazel-out/applebin_ios-ios_x86_64-fastbuild-ST-5557854aa1ac/bin/framework/objc/../../../../../framework/objc/TestFrameworkController.h:2:9: error: 'UIKit/UIKit.h' file not found
#import <UIKit/UIKit.h>
        ^
framework/objc/TestFrameworkProvider.swift:3:8: error: could not build Objective-C module 'TestFramework'
import TestFramework
       ^
Target //framework/objc:TestFrameworkProvider failed to build
INFO: Elapsed time: 0.311s, Critical Path: 0.26s
INFO: 3 processes: 3 internal.
FAILED: Build did NOT complete successfully

```

