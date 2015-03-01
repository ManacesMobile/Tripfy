//
//  tripfy_Utilties.m
//  tripfy
//
//  Created by eser on 28/02/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_Utilties.h"

@implementation tripfy_Utilties

- (id) init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (BOOL) stringCheck:(NSString *) string {
    if(string != nil && ![string isKindOfClass:[NSNull class]] && ![[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]){
        return YES;
    }
    
    return NO;
}
@end
