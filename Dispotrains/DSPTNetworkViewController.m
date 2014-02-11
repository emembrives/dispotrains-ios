//
//  DSPTNetworkViewController.m
//  Dispotrains
//
//  Created by Etienne Membrives on 09/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import "DSPTNetworkViewController.h"
#import "DSPTNetwork.h"
#import "DSPTLine.h"
#import "DSPTLineViewController.h"

@interface DSPTNetworkViewController ()
@property(atomic, strong) DSPTNetwork* network;
@end

@implementation DSPTNetworkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.network = [[DSPTNetwork alloc] initWithTableView:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self.network getAllLines] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LinePrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    DSPTLine* line = [[self.network getAllLines] objectAtIndex:indexPath.row];
    cell.textLabel.text = [line getLineDisplayName];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLineDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DSPTLineViewController* destViewController = segue.destinationViewController;
        destViewController.line = [[self.network getAllLines] objectAtIndex:indexPath.row];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
