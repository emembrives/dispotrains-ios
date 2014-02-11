//
//  DSPTElevator.m
//  Dispotrains
//
//  Created by Etienne Membrives on 09/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import "DSPTElevator.h"

@implementation DSPTElevator
-(DSPTElevator*) initWithJSONDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.elevatorId = [dict objectForKey:@"id"];
        self.direction = [dict objectForKey:@"direction"];
        self.situation = [dict objectForKey:@"situation"];
        self.status = [[dict objectForKey:@"status"] objectForKey:@"state"];
        self.lastUpdate = [[dict objectForKey:@"status"] objectForKey:@"lastupdate"];;
    }
    return self;
}
- (NSString*)getDisplayName {
    NSMutableString* name = [[NSMutableString alloc] initWithString:self.situation];
    if ([self.direction length] != 0) {
      [name appendString:@" - "];
      [name appendString:self.direction];
    }
    return name;
}
- (NSString*)getDisplayStatus {
    NSMutableString* status = [[NSMutableString alloc] initWithString:self.status];
    [status appendString:@" ("];
    [status appendString:self.lastUpdate];
    [status appendString:@")"];
    return status;
}
@end
