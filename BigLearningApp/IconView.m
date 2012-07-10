//
//  IconView.m
//  BigLearningApp
//
//  Created by Mihai Popa on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IconView.h"

@implementation IconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"alarm.png"]];
        self.multipleTouchEnabled = YES;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    startTouchPosition = [touch locationInView:self.superview ];
    NSLog(@"Start touch position: X:%f, Y:%f", startTouchPosition.x, startTouchPosition.y);
    
    if ([self.superview.superview isMemberOfClass:[UIScrollView class]])
    {
        
        originalSize.size =  [(UIScrollView*)self.superview.superview contentSize];
        CGRect screenRect = [[UIScreen mainScreen] bounds]; 
        [(UIScrollView *)self.superview.superview setContentSize:CGSizeMake(screenRect.size.width, screenRect.size.height)];
    }

}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    UITouch *aTouch = [touches anyObject];
    CGPoint loc = [aTouch locationInView:self];
    CGPoint prevloc = [aTouch previousLocationInView:self];
    
    CGRect myFrame = self.frame;
    float deltaX = loc.x - prevloc.x;
    float deltaY = loc.y - prevloc.y;
    myFrame.origin.x += deltaX;
    myFrame.origin.y += deltaY;
    [self setFrame:myFrame];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", self.superview.superview);
    if ([self.superview.superview isMemberOfClass:[UIScrollView class]])
    {
    [(UIScrollView *)self.superview.superview setContentSize:CGSizeMake(originalSize.size.width, originalSize.size.height)];
    }
}
@end
