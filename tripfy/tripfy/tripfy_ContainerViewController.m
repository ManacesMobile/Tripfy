//
//  tripfy_ContainerViewController.m
//  tripfy
//
//  Created by eser on 01/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_ContainerViewController.h"

@interface tripfy_ContainerViewController ()

@end

@implementation tripfy_ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mainSegue"]) {
        self.tripfy_segue = segue.destinationViewController;
    }
}

@end
