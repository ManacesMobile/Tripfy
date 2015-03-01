//
//  tripfy_SegueViewController.h
//  tripfy
//
//  Created by eser on 28/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tripfy_SegueViewController : UIViewController{
    NSString* holdTagValue;
    UIView* mainView;
    UIView* loginView;
    UIView* wellcomeView;
    BOOL hasMainView;
    BOOL hasLoginView;
    BOOL hasWellcomeView;
    NSString *autorotate;
}

- (void) swapViewControllers:(NSString *) _typeValue;
- (void) logout;
@end
