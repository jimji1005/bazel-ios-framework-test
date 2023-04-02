#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TestFrameworkController;

@protocol TestFrameworkControllerDelegate
-(void)controller:(TestFrameworkController *)controller
didOutputIntValue:(int)intValue
    andFloatValue:(float)floatValue;
@end

@interface TestFrameworkController: NSObject

@property (weak, nonatomic) id<TestFrameworkControllerDelegate> delegate;

- (void)start;

@end

NS_ASSUME_NONNULL_END
