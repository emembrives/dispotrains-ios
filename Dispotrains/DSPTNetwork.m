//
//  DSPTNetwork.m
//  Dispotrains
//
//  Created by Etienne Membrives on 09/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import "DSPTNetwork.h"
#import "AFNetworking.h"
#import "DSPTLine.h"

@interface DSPTNetwork ()
@property(atomic, strong) NSArray* lines;
@property(nonatomic, strong) AFHTTPRequestOperationManager* manager;
@property(nonatomic, strong) UITableViewController* controller;
@end

@implementation DSPTNetwork

- (id)initWithTableView:(UITableViewController*) controller {
    self = [super init];
    if (self) {
        self.controller = controller;
        self.manager = [AFHTTPRequestOperationManager manager];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",nil];
        AFHTTPRequestOperation* operation = [self.manager GET:@"http://dispotrains.membrives.fr/app/GetLines/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self parseResponseObject:responseObject];
            [[self.controller tableView] reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    return self;
}

- (void)parseResponseObject:(id)responseObject {
    NSMutableArray* lines = [[NSMutableArray alloc] init];
    for (NSDictionary* lineDict in responseObject) {
        [lines addObject:[[DSPTLine alloc] initWithJSONDict:lineDict]];
    }
    self.lines = lines;
}

- (NSArray*) getAllLines {
    return self.lines;
}
@end
