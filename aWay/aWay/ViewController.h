//
//  ViewController.h
//  aWay
//
//  Created by eser on 18.12.2014.
//  Copyright (c) 2014 eser. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Social;
@import Accounts;

@interface ViewController : UIViewController
@property (nonatomic, retain) ACAccountStore *accountStore;
@property (nonatomic, retain) ACAccount *facebookAccount;
- (IBAction)login:(id)sender;


@end

