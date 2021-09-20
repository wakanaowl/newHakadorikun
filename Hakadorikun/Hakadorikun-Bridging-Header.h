//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface UICircleView : UIView

@property (nonatomic) UIColor *color;

-(id)initWithFrameColor:(CGRect)frame color:(UIColor *)color;

@end
