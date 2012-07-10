//
//  SimpleView.m
//  BigLearningApp
//
//  Created by Mihai Popa on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleView.h"

@implementation SimpleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"credit_card.png"]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.superview resignFirstResponder];

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

@end
