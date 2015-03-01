//
//  AppDelegate.h
//  tripfy
//
//  Created by eser on 25/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tripfy_Utilties.h"
#import "tripfy_ContainerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) tripfy_Utilties *utils;
@property (strong, nonatomic) tripfy_ContainerViewController *root;
-(void) hideProgress;
-(void) showProgress;

@end

