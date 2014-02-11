//
//  DSPTLine.m
//  Dispotrains
//
//  Created by Etienne Membrives on 09/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import "DSPTLine.h"
#import "DSPTStation.h"

@implementation DSPTLine
- (DSPTLine*) initWithJSONDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.lineId = [dict objectForKey:@"id"];
        self.network = [dict objectForKey:@"network"];
        NSMutableArray* goodStations = [[NSMutableArray alloc] init];
        for (NSDictionary* stationDict in [dict objectForKey:@"goodStations"]) {
            [goodStations addObject:[[DSPTStation alloc] initWithJSONDict:stationDict line:self]];
        }
        self.goodStations = goodStations;
        NSMutableArray* badStations = [[NSMutableArray alloc] init];
        for (NSDictionary* stationDict in [dict objectForKey:@"badStations"]) {
            [badStations addObject:[[DSPTStation alloc] initWithJSONDict:stationDict line:self]];
        }
        self.badStations = badStations;
    }
    return self;
}

- (NSString*) getLineDisplayName {
    NSMutableString* name = [[NSMutableString alloc] initWithString:self.network];
    [name appendString:@" "];
    [name appendString:self.lineId];
    return name;
}
@end
