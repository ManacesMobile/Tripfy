//
//  tripfy_LoginViewController.h
//  tripfy
//
//  Created by BM Eser Kalac on 27/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripfy_LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_login;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_password;
- (IBAction)login:(id)sender;
- (IBAction)loginFacebook:(id)sender;
- (IBAction)signUp:(id)sender;

@end
