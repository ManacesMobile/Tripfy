//
//  aWay_WellcomeViewController.h
//  aWay
//
//  Created by eser on 18.12.2014.
//  Copyright (c) 2014 eser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aWay_WellcomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *view_main;
@property (weak, nonatomic) IBOutlet UIView *view_table;
@property (weak, nonatomic) IBOutlet UIView *view_hide;
@property (weak, nonatomic) IBOutlet UITableView *tView_menu;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yConstraint;

- (IBAction)showMenu:(id)sender;
- (IBAction)findTrip:(id)sender;
- (IBAction)createTrip:(id)sender;
@end
