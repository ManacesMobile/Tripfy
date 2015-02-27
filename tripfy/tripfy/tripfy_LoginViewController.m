//
//  tripfy_LoginViewController.m
//  tripfy
//
//  Created by BM Eser Kalac on 27/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_LoginViewController.h"

@interface tripfy_LoginViewController ()<UIScrollViewDelegate,UITextFieldDelegate>

@end

@implementation tripfy_LoginViewController
@synthesize txt_email,txt_password,scroll_login;

- (void)viewDidLoad {
    [super viewDidLoad];
    [txt_email setReturnKeyType:UIReturnKeyGo];
    [txt_password setReturnKeyType:UIReturnKeyGo];
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
}

- (IBAction)signUp:(id)sender {
}
@end
