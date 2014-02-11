//
//  DSPTStation.m
//  Dispotrains
//
//  Created by Etienne Membrives on 09/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import "DSPTStation.h"
#import "AFNetworking.h"

@interface DSPTStation()
@property(nonatomic, strong) NSArray* elevators;
@property(nonatomic, strong) AFHTTPRequestOperationManager* manager;
@property(nonatomic, assign) bool loaded;
@property(nonatomic, strong) UITableViewController* controller;
@end

@implementation DSPTStation
-(DSPTStation*) initWithJSONDict:(NSDictionary *)dict line:(DSPTLine *)line {
    self = [super init];
    if (self) {
        self.line = line;
        self.name = [dict objectForKey:@"name"];
        self.displayName = [dict objectForKey:@"displayname"];
        self.city = [dict objectForKey:@"city"];
        self.status = [dict objectForKey:@"status"];
        self.loaded = false;
    }
    return self;
}

-(NSArray*) getElevators:(UITableViewController*)controller {
    if (self.loaded == false) {
        self.controller = controller;
        
        self.manager = [AFHTTPRequestOperationManager manager];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",nil];
        NSMutableString* status = [[NSMutableString alloc] initWithString:@"http://dispotrains.membrives.fr/app/GetStation/"];
        [status appendString:self.name];
        [status appendString:@"/"];
        [self.manager GET: [status stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
             [self parseResponseObject:responseObject];
             self.loaded = true;
             [[self.controller tableView] reloadData];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    }
    return self.elevators;
}

- (void)parseResponseObject:(id)responseObject {
    NSMutableArray* elevators = [[NSMutableArray alloc] init];
    for (NSDictionary* elevatorDict in [responseObject objectForKey:@"elevators"]) {
        [elevators addObject:[[DSPTElevator alloc] initWithJSONDict:elevatorDict]];
    }
    self.elevators = elevators;
}
@end
