//
//  tripfy_SearchViewController.h
//  tripfy
//
//  Created by eser on 07/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripfy_SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain) IBOutlet UITableView *table_plannedTrip;
@property (weak, nonatomic) IBOutlet UIView *view_search;
@property (weak, nonatomic) IBOutlet UIView *view_plannedTrip;
@property (weak, nonatomic) IBOutlet UIButton *btn_planTrip;

- (void) setDriver;
- (void) setPassenger;
- (IBAction)save:(id)sender;

@end
