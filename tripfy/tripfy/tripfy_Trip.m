//
//  tripfy_Trip.m
//  tripfy
//
//  Created by eser on 10/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import "tripfy_Trip.h"

@implementation tripfy_Trip
@synthesize availableSeatCount,departurePoint,destinationPoint,departureDescript,destinationDescript,isLuggage,isPetCarry,isSmoking,seatCount,seatFee,tripShortName,tripStatus,createdAt,updatedAt,luggageType,objectId,maxLuggageSize,befortimeDelay;
- (id) init
{
    self = [super init];
    if (self) {
        self.availableSeatCount = nil;
        self.departurePoint = nil;
        self.departureDescript = nil;
        self.destinationDescript = nil;
        self.destinationPoint = nil;
        self.isLuggage = NO;
        self.isPetCarry = NO;
        self.isSmoking = NO;
        self.seatCount = 0;
        self.seatFee = 0;
        self.tripShortName = nil;
        self.tripStatus = NO;
        self.createdAt = nil;
        self.updatedAt = nil;
        self.luggageType = nil;
        self.objectId = nil;
        self.befortimeDelay = 0;
        self.maxLuggageSize = 0;
    }
    return self;
}
@end
