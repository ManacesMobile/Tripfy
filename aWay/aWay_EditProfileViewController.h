//
//  aWay_EditProfileViewController.h
//  aWay
//
//  Created by eser on 21.12.2014.
//  Copyright (c) 2014 eser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aWay_EditProfileViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scView_profile;
@property (weak, nonatomic) IBOutlet UIImageView *img_user;
@property (weak, nonatomic) IBOutlet UITextField *txt_userName;
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UITextField *txt_surname;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
@property (weak, nonatomic) IBOutlet UITextField *txt_confirmPass;
@property (weak, nonatomic) IBOutlet UITextField *txt_birthDate;
@property (weak, nonatomic) IBOutlet UITextField *txt_gender;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_phone;






- (IBAction)setPhoto:(id)sender;
- (IBAction)regist:(id)sender;

@end
