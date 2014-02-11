//
//  DSPTStation.h
//  Dispotrains
//
//  Created by Etienne Membrives on 09/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSPTLine.h"
#import "DSPTElevator.h"

@interface DSPTStation : NSObject
@property(nonatomic, weak) DSPTLine* line;
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* displayName;
@property(nonatomic, strong) NSString* city;
@property(nonatomic, assign) bool status;
@property(nonatomic, assign) bool hasElevators;

- (DSPTStation*)initWithJSONDict:(NSDictionary*) dict line:(DSPTLine*) line;
- (NSArray*)getElevators:(UITableViewController*)controller;
@end
