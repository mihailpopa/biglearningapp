//
//  ModalViewController.h
//  BigLearningApp
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModalViewController;

@protocol ModalViewControllerDelegate <NSObject>

-(void)dismissModalViewController:(ModalViewController*)sender;

@end

@interface ModalViewController : UIViewController
- (IBAction)dismissModal:(id)sender;
- (IBAction)saveModal:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) id<ModalViewControllerDelegate> delegate;
@end
