//
//  AppDelegate.m
//  BigLearningApp
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "TBVNavigationController.h"
#import "VCViewController.h"
#import "LittleGameController.h"
#import "MapViewController.h"
#import "MultiplePagesController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabController = _tabController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.tabController = [[UITabBarController alloc] init];
    VCViewController *viewController = [[VCViewController alloc] initWithNibName:@"VCViewController" bundle:nil];
    TBVNavigationController *tableNavController = [[TBVNavigationController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableNavController];
    LittleGameController *gameController = [[LittleGameController alloc] initWithNibName:@"LittleGameController" bundle:nil];
    MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    MultiplePagesController *multiplePagesController = [[MultiplePagesController alloc] initWithNibName:@"MultiplePagesController" bundle:nil];
    self.tabController.viewControllers = [NSArray arrayWithObjects:viewController,navController,gameController,navController2,multiplePagesController, nil];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:self.tabController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
