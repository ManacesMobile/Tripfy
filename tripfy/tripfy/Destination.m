//
//  Destination.m
//  tripfy
//
//  Created by eser on 10/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "Destination.h"

@implementation Destination
@synthesize destinationPoint,destinationShortName,createdAt,updatedAt,objectId;
- (id) init
{
    self = [super init];
    if (self) {
        self.destinationPoint = nil;
        self.destinationShortName = nil;
        self.createdAt = nil;
        self.updatedAt = nil;
        self.objectId = nil;
    }
    return self;
}
@end
