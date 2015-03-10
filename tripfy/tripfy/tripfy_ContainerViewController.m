//
//  tripfy_ContainerViewController.m
//  tripfy
//
//  Created by eser on 01/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_ContainerViewController.h"
#import "AppDelegate.h"

@interface tripfy_ContainerViewController (){
    AppDelegate *tripfy;
}

@end

@implementation tripfy_ContainerViewController
@synthesize isPassenger;
- (void)viewDidLoad {
    [super viewDidLoad];
    tripfy = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    tripfy.root = self;
    isPassenger = YES;
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Check if user is cached and linked to Facebook, if so, bypass login
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mainSegue"]) {
        self.tripfy_segue = segue.destinationViewController;
    }
}

-(void) wellcome{
    [self.tripfy_segue swapViewControllers:@"wellcome"];
}

-(void) main{
    [self.tripfy_segue swapViewControllers:@"main"];
}

-(void) login{
    [self.tripfy_segue swapViewControllers:@"login"];
}

@end
