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
@property (weak, nonatomic) IBOutlet UIView *view_container;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)messenger:(id)sender;
- (void) setDatePickerValues:(UILabel *) _showLbl selectedVal:(NSString *) _valLbl;
- (IBAction)doneDate:(id)sender;
- (IBAction)cancelDate:(id)sender;
@end
