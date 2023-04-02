#import "TestFrameworkController.h"

@interface TestFrameworkController ()

@end

@implementation TestFrameworkController

struct SimpleCStruct {
    int intValue;
    float floatValue;
};

- (instancetype)init {
    if (self = [super init]) {}
    return self;
}

- (void)start {
    SimpleCStruct aStruct = (struct SimpleCStruct){1, 0.5};

    [self.delegate controller:self
            didOutputIntValue:aStruct.intValue
                andFloatValue:aStruct.floatValue];
}

@end
