//
//  VCViewController.h
//  BigLearningApp
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@interface VCViewController : UIViewController<ModalViewControllerDelegate>
@property (strong, nonatomic) ModalViewController *modalController;

- (IBAction)presentModalAction:(id)sender;
- (IBAction)generateProgress:(id)sender;
@property (weak, nonatomic) IBOutlet UIProgressView *threadProgress;
@property (weak, nonatomic) IBOutlet UIView *progressView;
- (IBAction)showSuperView:(id)sender;
- (IBAction)showSubViews:(id)sender;
- (IBAction)showTags:(id)sender;
- (IBAction)makeSmaller:(id)sender;
- (IBAction)makeBigger:(id)sender;

@end
