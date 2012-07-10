//
//  MultiplePagesController.m
//  BigLearningApp
//
//  Created by Mihai Popa on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MultiplePagesController.h"

@implementation MultiplePagesController
@synthesize iconView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem* tabBarItem =  [[UITabBarItem alloc] initWithTitle:@"Pages" image:[UIImage imageNamed:@"page_empty.png"] tag:9];
        self.tabBarItem = tabBarItem;     }
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
    UIView *myView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    myView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"preview.jpg"]];
    CGRect iconFrame = CGRectMake(self.view.bounds.size.width / (320/26), self.view.bounds.size.height / (440/26), 26, 26);
    CGRect iconFrame2 = CGRectMake(self.view.bounds.size.width / (320/26) * 3, self.view.bounds.size.height / (440/26), 26, 26);
    SimpleView *simpleView = [[SimpleView alloc] initWithFrame:iconFrame2];
    IconView *icon = [[IconView alloc] initWithFrame:iconFrame];
    
    [myView addSubview:icon];
    [myView addSubview:simpleView];
    
    CGRect bigSize = CGRectMake(0, 0, myView.frame.size.width*2, myView.frame.size.height);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:myView.frame];
    
    scrollView.contentSize = bigSize.size;
    [scrollView setPagingEnabled:YES];
    [scrollView addSubview:myView];
    [self.view addSubview:scrollView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
