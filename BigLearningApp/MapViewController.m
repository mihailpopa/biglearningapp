//
//  MapViewController.m
//  BigLearningApp
//
//  Created by Mihai Popa on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () 
-(void)segmentedControlChanged:(UISegmentedControl*)sender;

@end
@implementation MapViewController
@synthesize myMap;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem* tabBarItem =  [[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"globe.png"] tag:9];
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


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects: @"Satellite",@"Standard",nil]];
    [segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    self.navigationItem.titleView = segmentedControl;

}

- (void)viewDidUnload
{
    [self setMyMap:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)segmentedControlChanged:(UISegmentedControl*)sender
{
    if ([sender selectedSegmentIndex]==0)
    {
        self.myMap.mapType = MKMapTypeSatellite;
    }
    else
        self.myMap.mapType = MKMapTypeStandard;
}
@end
