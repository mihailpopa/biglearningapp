//
//  LittleGameController.m
//  BigLearningApp
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LittleGameController.h"
#import "IconView.h"

@implementation LittleGameController
@synthesize movableView;
@synthesize startPosition;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem* tabBarItem =  [[UITabBarItem alloc] initWithTitle:@"Game" image:[UIImage imageNamed:@"game_controller.png"] tag:9];
        self.tabBarItem = tabBarItem;        
        //[self.view addSubview:[[IconView alloc] initWithFrame:CGRectMake(100, 100, 26, 26)]];
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

- (IBAction)startAnimation:(id)sender {
    self.movableView.hidden = NO;
    dispatch_queue_t q = dispatch_queue_create("queue", NULL);
    dispatch_async(q, ^{
        for (int i = 0 ; i < 30; i++)
        {
            [NSThread sleepUntilDate:[NSDate dateWithTimeInterval:0.01 sinceDate:[NSDate date]]];
            CGRect frame = self.movableView.frame;
            frame.origin.y -= i;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.movableView.frame = frame;
            });
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.movableView.frame = self.startPosition;
            self.movableView.hidden = NO;   
        });

    });
   
}

- (IBAction)moveLeft:(id)sender {
    CGRect position = self.startPosition;
    position.origin.x -= 10;
    self.startPosition = position;
    self.movableView.frame = self.startPosition;
}

- (IBAction)moveRight:(id)sender {
    CGRect position = self.startPosition;
    position.origin.x += 10;
    self.startPosition = position;    
    self.movableView.frame = self.startPosition;

}

- (IBAction)loadView:(id)sender {
   if (!self.movableView)
   {
    self.movableView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height - 20, 10, 10)];
    self.movableView.backgroundColor = [UIColor redColor];
       self.startPosition = self.movableView.frame;
       [self.view addSubview:movableView];
   }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch =  [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    NSLog(@"Touch location: X:%f, Y:%f", location.x, location.y);
}
@end
