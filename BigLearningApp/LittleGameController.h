//
//  LittleGameController.h
//  BigLearningApp
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LittleGameController : UIViewController
- (IBAction)startAnimation:(id)sender;
- (IBAction)moveLeft:(id)sender;
- (IBAction)moveRight:(id)sender;
- (IBAction)loadView:(id)sender;
@property (strong, nonatomic) UIView *movableView;
@property CGRect startPosition;
@end
