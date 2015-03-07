//
//  tripfy_MainViewController.m
//  tripfy
//
//  Created by BM Eser Kalac on 27/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_MainViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "tripfy_LoginViewController.h"
#import "tripfy_WellcomeViewController.h"

@interface tripfy_MainViewController (){
    tripfy_LoginViewController *login;
    tripfy_WellcomeViewController *wellcome;
}

@end

@implementation tripfy_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.hidden = YES;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    login = [storyboard instantiateViewControllerWithIdentifier:@"tripfy_LoginViewController"];
    wellcome = [storyboard instantiateViewControllerWithIdentifier:@"tripfy_WellcomeViewController"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
