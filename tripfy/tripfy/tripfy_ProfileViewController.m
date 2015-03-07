//
//  tripfy_ProfileViewController.m
//  tripfy
//
//  Created by eser on 07/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_ProfileViewController.h"

@interface tripfy_ProfileViewController ()

@end

@implementation tripfy_ProfileViewController
@synthesize txt_gender,txt_name,birthDay,scroll_profil;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [txt_gender setReturnKeyType:UIReturnKeyGo];
    [txt_name setReturnKeyType:UIReturnKeyGo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField{
    if (txt_gender==textField) {
        scroll_profil.contentSize = CGSizeMake(scroll_profil.frame.size.width, scroll_profil.frame.size.height+44);
        CGPoint offset = CGPointMake(0, 44);
        [scroll_profil setContentOffset:offset animated:YES];
    }
    return  YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [self.view endEditing:YES];
    scroll_profil.contentSize = CGSizeMake(0, 0);
    CGPoint offset = CGPointMake(0, 0);
    [scroll_profil setContentOffset:offset animated:YES];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)birthDay:(id)sender {
}

- (IBAction)save:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
