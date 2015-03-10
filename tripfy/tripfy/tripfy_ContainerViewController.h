//
//  tripfy_ContainerViewController.h
//  tripfy
//
//  Created by eser on 01/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tripfy_SegueViewController.h"
#import "tripfy_MainViewController.h"

@interface tripfy_ContainerViewController : UIViewController
@property (nonatomic, weak) tripfy_SegueViewController *tripfy_segue;
@property (nonatomic, weak) tripfy_MainViewController *mainViewController;
@property (nonatomic) BOOL isPassenger;
-(void) wellcome;
-(void) main;
-(void) login;
@end
