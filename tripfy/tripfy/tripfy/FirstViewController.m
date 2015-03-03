//
//  FirstViewController.m
//  tripfy
//
//  Created by eser on 25/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@interface FirstViewController (){
    AppDelegate *tripfy;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tripfy = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backmain:(id)sender {
    [tripfy.root wellcome];
}
@end
