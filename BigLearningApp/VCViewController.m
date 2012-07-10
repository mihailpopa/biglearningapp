//
//  VCViewController.m
//  BigLearningApp
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VCViewController.h"

@implementation VCViewController
@synthesize threadProgress;
@synthesize progressView;
@synthesize modalController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) { 
        self.title = @"VCController";
        self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
        self.threadProgress.progress = 0.0f;
        self.progressView.hidden = YES;
        UITabBarItem* tabBarItem =  [[UITabBarItem alloc] initWithTitle:@"VC" image:[UIImage imageNamed:@"arrow_up.png"] tag:9];
        self.tabBarItem = tabBarItem;    
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)presentModalAction:(id)sender {
    if (!self.modalController) self.modalController = [[ModalViewController alloc] init];
    self.modalController.delegate = self;
    [self presentModalViewController:self.modalController animated:YES];
}

- (IBAction)generateProgress:(id)sender {
    
    dispatch_queue_t q = dispatch_queue_create("queue", NULL);
    dispatch_async(q, ^{
        NSLog(@"%@",[NSDate date]);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressView.hidden = NO;
        });
        for (int i = 0 ; i < 10; i++)
        {
            [NSThread sleepUntilDate:[NSDate dateWithTimeInterval:1 sinceDate:[NSDate date]]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.threadProgress.progress = (float) (i+1) / 10;
            });
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressView.hidden = YES;
            self.threadProgress.progress = 0.0f;
        });
        NSLog(@"%@",[NSDate date]);
    });
    
}
-(void)dismissModalViewController:(ModalViewController*)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidUnload {
    [self setThreadProgress:nil];
    [self setProgressView:nil];
    [super viewDidUnload];
}
- (IBAction)showSuperView:(id)sender {
    NSLog(@"Superview: %@", self.view.superview.superview.superview);
    NSLog(@"Parent view controller: %@", self.parentViewController);
}

- (IBAction)showSubViews:(id)sender {
    NSLog(@"%@", self.view.subviews);
}

- (IBAction)showTags:(id)sender {
    for (int i = 1 ; i <= 4 ; i++)
    NSLog(@"%@", [self.view viewWithTag:i]);
}

- (IBAction)makeSmaller:(id)sender {
    for (UIView *myView in self.view.subviews)
    {
        CGRect frame = myView.frame;
        frame.size.width = frame.size.width * 0.9;
        frame.size.height = frame.size.height * 0.9;
        myView.frame = frame;
    }
}

- (IBAction)makeBigger:(id)sender {
    for (UIView *myView in self.view.subviews)
    {
        CGRect frame = myView.frame;
        frame.size.width = frame.size.width * 1.1;
        frame.size.height = frame.size.height * 1.1;
        myView.frame = frame;
    }
}


@end
