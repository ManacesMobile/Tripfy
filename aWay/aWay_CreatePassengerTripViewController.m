//
//  aWay_CreateTripViewController.m
//  aWay
//
//  Created by eser on 23.12.2014.
//  Copyright (c) 2014 eser. All rights reserved.
//

#import "aWay_CreatePassengerTripViewController.h"

@interface aWay_CreatePassengerTripViewController ()

@end

@implementation aWay_CreatePassengerTripViewController
@synthesize scroll_infos;
- (void)viewDidLoad {
    [super viewDidLoad];
    [scroll_infos setContentSize:CGSizeMake(scroll_infos.frame.size.width, 600)];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
