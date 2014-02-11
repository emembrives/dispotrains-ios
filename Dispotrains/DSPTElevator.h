//
//  DSPTElevator.h
//  Dispotrains
//
//  Created by Etienne Membrives on 09/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSPTStation.h"

@interface DSPTElevator : NSObject
@property(nonatomic, strong) NSString* elevatorId;
@property(nonatomic, strong) NSString* direction;
@property(nonatomic, strong) NSString* situation;
@property(nonatomic, strong) NSString* status;
@property(nonatomic, strong) NSString* lastUpdate;

- (DSPTElevator*)initWithJSONDict:(NSDictionary*) dict;
- (NSString*)getDisplayName;
- (NSString*)getDisplayStatus;
@end
