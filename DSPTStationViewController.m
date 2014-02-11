//
//  DSPTStationViewController.m
//  Dispotrains
//
//  Created by Etienne Membrives on 11/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import "DSPTStationViewController.h"
#import "DSPTElevator.h"

@interface DSPTStationViewController ()

@end

@implementation DSPTStationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.station.displayName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.station getElevators:self] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ElevatorPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    DSPTElevator* elevator = [[self.station getElevators:self] objectAtIndex:indexPath.row];
    cell.textLabel.text = [elevator getDisplayName];
    cell.detailTextLabel.text = [elevator getDisplayStatus];
    return cell;
}

@end
