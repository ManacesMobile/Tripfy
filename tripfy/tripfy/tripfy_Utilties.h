//
//  tripfy_Utilties.h
//  tripfy
//
//  Created by eser on 28/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface tripfy_Utilties : NSObject
- (BOOL) stringCheck:(NSString *) string;
- (UIImage *) maskImage:(UIImage *) image withMask:(UIImage *) mask;

@end
