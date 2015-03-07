//
//  tripfy_LoginViewController.m
//  tripfy
//
//  Created by BM Eser Kalac on 27/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_LoginViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "AppDelegate.h"
#import "tripfy_ProfileViewController.h"

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface tripfy_LoginViewController ()<UIScrollViewDelegate,UITextFieldDelegate>{
    AppDelegate *tripfy;
    tripfy_ProfileViewController *profil;
}

@end

@implementation tripfy_LoginViewController
@synthesize txt_email,txt_password,scroll_login;

- (void)viewDidLoad {
    [super viewDidLoad];
    tripfy = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [txt_email setReturnKeyType:UIReturnKeyGo];
    [txt_password setReturnKeyType:UIReturnKeyGo];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    profil = [storyboard instantiateViewControllerWithIdentifier:@"tripfy_ProfileViewController"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    if (txt_email==textField) {
        scroll_login.contentSize = CGSizeMake(scroll_login.frame.size.width, scroll_login.frame.size.height+50);
        CGPoint offset = CGPointMake(0, 120);
        [scroll_login setContentOffset:offset animated:YES];
    }else if (txt_password==textField) {
        scroll_login.contentSize = CGSizeMake(scroll_login.frame.size.width, scroll_login.frame.size.height+50);
        CGPoint offset = CGPointMake(0, 160);
        [scroll_login setContentOffset:offset animated:YES];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (txt_email==textField) {
        [txt_password becomeFirstResponder];
        scroll_login.contentSize = CGSizeMake(scroll_login.frame.size.width, scroll_login.frame.size.height+50);
        CGPoint offset = CGPointMake(0, 160);
        [scroll_login setContentOffset:offset animated:YES];
    }else if (txt_password==textField) {
        [self scrollDefault];
        [self.view endEditing:YES];
        [self login:0];
    }
    
    return YES;
}


-(void) scrollDefault{
    scroll_login.contentSize = CGSizeMake(scroll_login.frame.size.width, scroll_login.frame.size.height);
    CGPoint offset = CGPointMake(0, 0);
    [scroll_login setContentOffset:offset animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender {
}

- (IBAction)loginFacebook:(id)sender {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [tripfy hideProgress]; // Hide loading indicator
        
        if (!user) {
            NSString *errorMessage = nil;
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                errorMessage = @"Uh oh. The user cancelled the Facebook login.";
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                errorMessage = [error localizedDescription];
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
                                                            message:errorMessage
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Dismiss", nil];
            [alert show];
        } else {
            if (user.isNew) {
                NSLog(@"User with facebook signed up and logged in!");
            } else {
                NSLog(@"User with facebook logged in!");
            }
            [self goWellcome];
        }
    }];
    
    [tripfy showProgress]; // Show loading indicator until login is finished

}

- (void)goWellcome{
    [tripfy.root wellcome];
}

- (IBAction)signUp:(id)sender {
    if (SYSTEM_VERSION_LESS_THAN(@"8.0")) {
        [self presentViewController:profil animated:NO completion:nil];
    }else{
        [self showViewController:profil sender:0];
    }
   
}
@end
