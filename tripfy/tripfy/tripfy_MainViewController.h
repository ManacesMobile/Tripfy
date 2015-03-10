//
//  tripfy_MainViewController.h
//  tripfy
//
//  Created by BM Eser Kalac on 27/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tripfy_SegueViewController.h"
@interface tripfy_MainViewController : UIViewController<UITabBarControllerDelegate>
@property (nonatomic, weak) tripfy_SegueViewController *tripfy_segue;
@property (weak, nonatomic) IBOutlet UIView *view_switch;
- (IBAction)messenger:(id)sender;
@end
