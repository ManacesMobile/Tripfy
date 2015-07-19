//
//  aWay_ListProfileViewController.h
//  aWay
//
//  Created by eser on 21.12.2014.
//  Copyright (c) 2014 eser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aWay_ListProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *view_image;
@property (weak, nonatomic) IBOutlet UIImageView *img_photo;
@property (weak, nonatomic) IBOutlet UILabel *lbl_name;
@property (weak, nonatomic) IBOutlet UILabel *lbl_profilName;
@property (weak, nonatomic) IBOutlet UILabel *lbl_surname;
@property (weak, nonatomic) IBOutlet UILabel *lbl_birthdate;
@property (weak, nonatomic) IBOutlet UILabel *lbl_age;
@property (weak, nonatomic) IBOutlet UILabel *lbl_gender;
@property (weak, nonatomic) IBOutlet UILabel *lbl_phone;
@property (weak, nonatomic) IBOutlet UILabel *lbl_email;

@end
