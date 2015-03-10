//
//  tripfy_MainViewController.m
//  tripfy
//
//  Created by BM Eser Kalac on 27/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_MainViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "tripfy_LoginViewController.h"
#import "tripfy_WellcomeViewController.h"
#import "tripfy_TabbarViewController.h"
#import "tripfy_SearchViewController.h"
#import "SevenSwitch.h"
#import "AppDelegate.h"

@interface tripfy_MainViewController (){
    tripfy_LoginViewController *login;
    tripfy_WellcomeViewController *wellcome;
    tripfy_TabbarViewController *tabbarPassenger;
    tripfy_TabbarViewController *tabbarDriver;
    AppDelegate *tripfy;
    tripfy_SearchViewController *plan;
    tripfy_SearchViewController *search;
}

@end

@implementation tripfy_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.hidden = YES;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    login = [storyboard instantiateViewControllerWithIdentifier:@"tripfy_LoginViewController"];
    wellcome = [storyboard instantiateViewControllerWithIdentifier:@"tripfy_WellcomeViewController"];
    tripfy = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view.
    
    tabbarPassenger = [storyboard instantiateViewControllerWithIdentifier:@"tripfy_TabbarViewController"];
    tabbarPassenger.delegate = self;
    if (tripfy.index>0) {
       tabbarPassenger.selectedIndex = tripfy.index;
    }
    tabbarPassenger.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tabbarPassenger.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
    //tabbarPassenger.view.hidden = YES;
    
    tabbarDriver = [storyboard instantiateViewControllerWithIdentifier:@"tripfy_TabbarViewController"];
    tabbarDriver.delegate = self;
    if (tripfy.index>0) {
        tabbarDriver.selectedIndex = tripfy.index;
    }
    tabbarDriver.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tabbarDriver.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
    //tabbarDriver.view.hidden = YES;
    
    [self.view addSubview:tabbarPassenger.view];
    [self.view addSubview:tabbarDriver.view];
    
    SevenSwitch *selectSwitch = [[SevenSwitch alloc] initWithFrame:CGRectMake(0, 4, 70, 35)];
    selectSwitch.center = CGPointMake(30, 22);
    [selectSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    selectSwitch.onImage = [UIImage imageNamed:@"passenger.png"];
    selectSwitch.offImage = [UIImage imageNamed:@"taxi.png"];
    selectSwitch.onColor = [UIColor clearColor];
    if (tripfy.root.isPassenger) {
        [selectSwitch setOn:YES];
        self.view.backgroundColor = UIColorFromRGB(0x2D9AE0);
        //tabbarDriver.view.hidden = YES;
        //tabbarPassenger.view.hidden = NO;
        tabbarDriver.view.alpha = 0;
        
    }else{
        
        [selectSwitch setOn:NO];
        //tabbarDriver.view.hidden = NO;
        
        tabbarPassenger.view.alpha = 0;
        //tabbarPassenger.view.hidden = YES;
        self.view.backgroundColor = UIColorFromRGB(0xFCC208);
    }
    [self setDriverTabbar];
    [self setPassengerTabbar];
    
    selectSwitch.isRounded = NO;
    [self.view_switch addSubview:selectSwitch];
    
}


- (void)switchChanged:(SevenSwitch *)sender {
    NSLog(@"Changed value to: %@", sender.on ? @"ON" : @"OFF");
    [self.view layoutIfNeeded];

    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         if (sender.on) {
                             tabbarDriver.view.alpha = 0;
                             //tabbarPassenger.view.hidden = NO;
                             tripfy.root.isPassenger = YES;
                             self.view.backgroundColor = UIColorFromRGB(0x2D9AE0);
                             //tabbarDriver.view.hidden = YES;
                             tabbarPassenger.view.alpha = 1;
                         }else{
                             tabbarPassenger.view.alpha = 0;
                             //tabbarDriver.view.hidden = NO;
                             tabbarDriver.view.alpha = 1;
                             tripfy.root.isPassenger = NO;
                             self.view.backgroundColor = UIColorFromRGB(0xFCC208);
                            // tabbarPassenger.view.hidden = YES;
                         }
                         
                         [self.view layoutIfNeeded]; // Called on parent view
                     }];
    
}

-(void) setDriverTabbar{
    tabbarDriver.tabBar.tintColor = [UIColor colorWithRed:0.98 green:0.76 blue:0.03 alpha:1];
    [[[tabbarDriver.viewControllers objectAtIndex:0] tabBarItem] setImage:[UIImage imageNamed:@"tripStatus@2x.png"]];
    [[[tabbarDriver.viewControllers objectAtIndex:1] tabBarItem] setImage:[UIImage imageNamed:@"notification@2x.png"]];
    [[[tabbarDriver.viewControllers objectAtIndex:2] tabBarItem] setImage:[UIImage imageNamed:@"planTrip@2x.png"]];
    [[[tabbarDriver.viewControllers objectAtIndex:3] tabBarItem] setImage:[UIImage imageNamed:@"settings@2x.png"]];
    plan = (tripfy_SearchViewController *)[tabbarPassenger.viewControllers objectAtIndex:2];
    [plan setDriver];
    [[tabbarDriver.tabBar.items objectAtIndex:0] setTitle:@"Planned Trips"];
    [[tabbarDriver.tabBar.items objectAtIndex:1] setTitle:@"Notificatios"];
    [[tabbarDriver.tabBar.items objectAtIndex:2] setTitle:@"Plan a Trip"];
    [[tabbarDriver.tabBar.items objectAtIndex:3] setTitle:@"Settings"];
    
    [[[tabbarDriver.viewControllers objectAtIndex:1] tabBarItem] setBadgeValue:@"4"];
}

-(void) setPassengerTabbar{
    tabbarPassenger.tabBar.tintColor = [UIColor colorWithRed:0.17 green:0.6 blue:0.87 alpha:1];
    [[[tabbarPassenger.viewControllers objectAtIndex:0] tabBarItem] setImage:[UIImage imageNamed:@"tripStatus@2x.png"]];
    [[[tabbarPassenger.viewControllers objectAtIndex:1] tabBarItem] setImage:[UIImage imageNamed:@"notification@2x.png"]];
    [[[tabbarPassenger.viewControllers objectAtIndex:2] tabBarItem] setImage:[UIImage imageNamed:@"search@2x.png"]];
    [[[tabbarPassenger.viewControllers objectAtIndex:3] tabBarItem] setImage:[UIImage imageNamed:@"settings@2x.png"]];
    search = (tripfy_SearchViewController *)[tabbarPassenger.viewControllers objectAtIndex:2];
    [search setPassenger];
    [[tabbarPassenger.tabBar.items objectAtIndex:0] setTitle:@"Trips"];
    [[tabbarPassenger.tabBar.items objectAtIndex:1] setTitle:@"Notificatios"];
    [[tabbarPassenger.tabBar.items objectAtIndex:2] setTitle:@"Search a Trip"];
    [[tabbarPassenger.tabBar.items objectAtIndex:3] setTitle:@"Settings"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)messenger:(id)sender {
    
}
@end
