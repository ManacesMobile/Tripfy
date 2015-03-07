//
//  tripfy_ProfileViewController.h
//  tripfy
//
//  Created by eser on 07/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripfy_ProfileViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_profil;
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UIButton *birthDay;
@property (weak, nonatomic) IBOutlet UITextField *txt_gender;

- (IBAction)birthDay:(id)sender;
- (IBAction)save:(id)sender;
@end
