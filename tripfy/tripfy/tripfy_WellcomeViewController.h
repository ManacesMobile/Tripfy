//
//  tripfy_WellcomeViewController.h
//  tripfy
//
//  Created by BM Eser Kalac on 27/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripfy_WellcomeViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIView *headerView;
@property (nonatomic, strong) IBOutlet UILabel *headerNameLabel;
@property (nonatomic, strong) IBOutlet UIImageView *headerImageView;
@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
- (IBAction)enter:(id)sender;
- (IBAction)logOut:(id)sender;
@end
