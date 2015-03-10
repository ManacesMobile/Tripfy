//
//  tripfy_Trip.h
//  tripfy
//
//  Created by eser on 10/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <Parse/Parse.h>
#import <Foundation/Foundation.h>

@interface tripfy_Trip : NSObject
@property(nonatomic, retain)NSString *availableSeatCount;
@property(nonatomic, retain)NSString *createdAt;
@property(nonatomic, retain)NSString *luggageType;
@property(nonatomic, retain)NSString *objectId;
@property(nonatomic, retain)NSString *tripShortName;
@property(nonatomic, retain)NSString *updatedAt;
@property(nonatomic, retain)NSString *destinationDescript;
@property(nonatomic, retain)NSString *departureDescript;
@property(nonatomic, retain)PFGeoPoint *departurePoint;
@property(nonatomic, retain)PFGeoPoint *destinationPoint;

@property(nonatomic)BOOL isLuggage;
@property(nonatomic)BOOL isPetCarry;
@property(nonatomic)BOOL isSmoking;
@property(nonatomic)BOOL tripStatus;

@property(nonatomic)int befortimeDelay;
@property(nonatomic)int maxLuggageSize;
@property(nonatomic)int seatCount;
@property(nonatomic)int seatFee;



@end
