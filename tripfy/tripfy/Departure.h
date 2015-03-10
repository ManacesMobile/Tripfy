//
//  Departure.h
//  tripfy
//
//  Created by eser on 10/03/15.
//  Copyright (c) 2015 tripfy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Departure : NSObject
@property(nonatomic, retain)NSString *departureShortName;
@property(nonatomic, retain)NSString *departurePoint;
@property(nonatomic, retain)NSString *objectId;
@property(nonatomic, retain)NSString *createdAt;
@property(nonatomic, retain)NSString *updatedAt;
@end
