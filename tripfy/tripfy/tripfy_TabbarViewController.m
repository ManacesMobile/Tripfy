//
//  tripfy_TabbarViewController.m
//  tripfy
//
//  Created by eser on 01/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_TabbarViewController.h"

@interface tripfy_TabbarViewController ()

@end

@implementation tripfy_TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Test"];

}

-(void) viewDidAppear:(BOOL)animated{
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:NSLocalizedString(@"BotonMapas", @"comment")];

    [self.tabBarController setSelectedIndex:2];
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
