//
//  tripfy_SegueViewController.m
//  tripfy
//
//  Created by eser on 28/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_SegueViewController.h"
#import "tripfy_LoginViewController.h"
#import "tripfy_MainViewController.h"
#import "tripfy_WellcomeViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "AppDelegate.h"

#define SegueIdentifierMain @"main"
#define SegueIdentifierLogin @"login"
#define SegueIdentifierWellcome @"wellcome"

@interface tripfy_SegueViewController (){
    AppDelegate *tripfy;
}
@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) tripfy_MainViewController *mainViewController;
@property (strong, nonatomic) tripfy_LoginViewController *loginViewController;
@property (strong, nonatomic) tripfy_WellcomeViewController *wellcomeViewController;
@end

@implementation tripfy_SegueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    holdTagValue = @"";
    tripfy = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view.
    
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        NSLog(@"Enter");
       self.currentSegueIdentifier = SegueIdentifierWellcome;
    }else{
        self.currentSegueIdentifier = SegueIdentifierLogin;
    }

    
        /*NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *drawPatternLockKey = [userDefaults objectForKey:@"lockPassword"];
        if (![[tripfy utils] stringCheck:drawPatternLockKey]) {
            self.currentSegueIdentifier = SegueIdentifierLogin;
        }else{
            self.currentSegueIdentifier = SegueIdentifierWellcome;
        }*/
    
    
    
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    
    hasMainView = NO;
    hasWellcomeView = NO;
    hasLoginView = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if (([segue.identifier isEqualToString:SegueIdentifierMain]) && !self.mainViewController) {
        self.mainViewController = segue.destinationViewController;
    }
    
    if (([segue.identifier isEqualToString:SegueIdentifierLogin]) && !self.loginViewController) {
        self.loginViewController = segue.destinationViewController;
    }
    
    if (([segue.identifier isEqualToString:SegueIdentifierWellcome]) && !self.wellcomeViewController) {
        self.wellcomeViewController = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:SegueIdentifierMain]) {
        if (hasMainView) {
            mainView.hidden = NO;
            wellcomeView.hidden = YES;
            loginView.hidden = YES;
        }
        else {
            [self addChildViewController:segue.destinationViewController];
            mainView = ((UIViewController *)segue.destinationViewController).view;
            
            mainView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            mainView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:mainView];
            [segue.destinationViewController didMoveToParentViewController:self];
            hasMainView = YES;
            //[tripfy addViewController:self.mainViewController atIndex:1];
        }
    }
    
    else if ([segue.identifier isEqualToString:SegueIdentifierLogin]) {
        if (hasLoginView) {
            mainView.hidden = YES;
            wellcomeView.hidden = YES;
            loginView.hidden = NO;
            
        }
        else {
            [self addChildViewController:segue.destinationViewController];
            loginView  = ((UIViewController *)segue.destinationViewController).view;
            loginView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            loginView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:loginView];
            [segue.destinationViewController didMoveToParentViewController:self];
            mainView.hidden = YES;
            wellcomeView.hidden = YES;
            loginView.hidden = NO;
            hasLoginView = YES;
            //[dmaAppDelegate addViewController:self.loginViewController atIndex:0];
        }
    }
    
    else if ([segue.identifier isEqualToString:SegueIdentifierWellcome]) {
        if (hasWellcomeView) {
            mainView.hidden = YES;
            wellcomeView.hidden = NO;
            loginView.hidden = YES;
            
        }
        else {
            [self addChildViewController:segue.destinationViewController];
            wellcomeView = ((UIViewController *)segue.destinationViewController).view;
            wellcomeView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            wellcomeView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:wellcomeView];
            [segue.destinationViewController didMoveToParentViewController:self];
            mainView.hidden = YES;
            wellcomeView.hidden = NO;
            loginView.hidden = YES;
            hasWellcomeView = YES;
            
           // [tripfy addViewController:self.wellcomeViewController atIndex:2];
            
        }
    }
}


- (void)swapViewControllers:(NSString *) _typeValue{
    if (_typeValue != holdTagValue) {
        
        if ([_typeValue isEqualToString:@"login"]) {
            self.currentSegueIdentifier = SegueIdentifierLogin;
        } else if ([_typeValue isEqualToString:@"wellcome"]) {
            self.currentSegueIdentifier = SegueIdentifierWellcome;
        }else if ([_typeValue isEqualToString:@"main"]) {
            self.currentSegueIdentifier = SegueIdentifierMain;
        }
        [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
        holdTagValue = _typeValue;
    }
}

- (void) logout{
    hasMainView = NO;
    [mainView removeFromSuperview];
    self.mainViewController = nil;
    [self swapViewControllers:@"login"];
}

- (void) lowMemory{
    hasMainView = NO;
    holdTagValue = @"";
    [mainView removeFromSuperview];
    self.mainViewController = nil;
    [self swapViewControllers:@"main"];
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
