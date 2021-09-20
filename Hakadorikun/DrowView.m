//
//  DrowView.m
//  Hakadorikun
//
//  Created by 奥若菜 on 2021/09/20.
//

#import <Foundation/Foundation.h>
#import "Hakadorikun-Bridging-Header.h"
 
@implementation UICircleView
@synthesize color;
 
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
 
- (id)initWithFrameColor:(CGRect)frame color:(UIColor *)refcolor
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.color = refcolor;
    }
    return self;
}
 
-(void)drawRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.width;
    CGContextSetFillColorWithColor(c, self.color.CGColor);
    CGContextFillEllipseInRect(c, CGRectMake(0, 0, w, h));
    UIView *colorRect = [[UICircleView alloc] initWithFrameColor:rect color:color];
    colorRect.backgroundColor = [UIColor clearColor];
}



@end

