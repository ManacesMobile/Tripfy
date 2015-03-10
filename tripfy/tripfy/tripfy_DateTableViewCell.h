//
//  tripfy_DateTableViewCell.h
//  tripfy
//
//  Created by eser on 10/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripfy_DateTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_date;
@property (weak, nonatomic) IBOutlet UIImageView *img_date;
@property (weak, nonatomic) IBOutlet UILabel *lbl_dateTitle;

@end
