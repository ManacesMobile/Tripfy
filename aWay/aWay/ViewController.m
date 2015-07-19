//
//  ViewController.m
//  aWay
//
//  Created by eser on 18.12.2014.
//  Copyright (c) 2014 eser. All rights reserved.
//

#import "ViewController.h"
#import "aWay_WellcomeViewController.h"

@interface ViewController (){
    aWay_WellcomeViewController *welcome;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    welcome = [self.storyboard instantiateViewControllerWithIdentifier:@"aWay_WellcomeViewController"];
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationController.navigationBar.hidden = YES;
    
    NSString *acessToken = [NSString stringWithFormat:@"%@", self.facebookAccount.credential.oauthToken];
    
}

- (IBAction)getMeButtonTapped:(id)sender {
    self.accountStore = [[ACAccountStore alloc]init];
    
    ACAccountType *FBaccountType= [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    
    NSString *key = @"1544549362454386";
    NSDictionary *dictFB = [NSDictionary dictionaryWithObjectsAndKeys:key,ACFacebookAppIdKey,@[@"email"],ACFacebookPermissionsKey, nil];
    
    
    [self.accountStore requestAccessToAccountsWithType:FBaccountType options:dictFB completion:
     ^(BOOL granted, NSError *e) {
         NSLog(@"facebook account =%@",[self.facebookAccount valueForKeyPath:@"properties.uid"]);
         if (granted) {
             NSArray *accounts = [self.accountStore accountsWithAccountType:FBaccountType];
             
             //it will always be the last object with single sign on
             self.facebookAccount = [accounts lastObject];
             
             //i  got the Facebook UID and logged it here (ANSWER)
             
             NSLog(@"facebook account =%@",[self.facebookAccount valueForKeyPath:@"properties.uid"]);
             
         } else {
             //Fail gracefully...
             NSLog(@"error getting permission %@",e);
             
         }
     }];
    /*
    if(!_accountStore)
        _accountStore = [[ACAccountStore alloc] init];
    
    ACAccountType *facebookTypeAccount = [_accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    
    [_accountStore requestAccessToAccountsWithType:facebookTypeAccount
                                           options:@{ACFacebookAppIdKey: self.facebookAccount.credential.oauthToken, ACFacebookPermissionsKey: @[@"email"]}
                                        completion:^(BOOL granted, NSError *error) {
                                            if(granted){
                                                NSArray *accounts = [_accountStore accountsWithAccountType:facebookTypeAccount];
                                                _facebookAccount = [accounts lastObject];
                                                NSLog(@"Success");
                                                
                                                [self me];
                                            }else{
                                                // ouch
                                                NSLog(@"Fail");
                                                NSLog(@"Error: %@", error);
                                            }
                                        }];*/
}

- (void)me{
    NSURL *meurl = [NSURL URLWithString:@"https://graph.facebook.com/me"];
    
    SLRequest *merequest = [SLRequest requestForServiceType:SLServiceTypeFacebook
                                              requestMethod:SLRequestMethodGET
                                                        URL:meurl
                                                 parameters:nil];
    
    merequest.account = _facebookAccount;
    
    [merequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        NSString *meDataString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", meDataString);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
   // [self showViewController:welcome sender:0];
}
@end
