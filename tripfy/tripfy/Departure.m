//
//  Departure.m
//  tripfy
//
//  Created by eser on 10/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "Departure.h"

@implementation Departure
@synthesize departurePoint,departureShortName,createdAt,updatedAt,objectId;
- (id) init
{
    self = [super init];
    if (self) {
        self.departureShortName = nil;
        self.departurePoint = nil;
        self.createdAt = nil;
        self.updatedAt = nil;
        self.objectId = nil;
    }
    return self;
}
@end
