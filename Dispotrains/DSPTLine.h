//
//  DSPTLine.h
//  Dispotrains
//
//  Created by Etienne Membrives on 09/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSPTLine : NSObject
@property(nonatomic, strong) NSArray* goodStations;
@property(nonatomic, strong) NSArray* badStations;
@property(nonatomic, strong) NSString* network;
@property(nonatomic, strong) NSString* lineId;

- (DSPTLine*)initWithJSONDict:(NSDictionary*) dict;
- (NSString*)getLineDisplayName;
@end
