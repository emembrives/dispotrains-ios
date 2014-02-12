//
//  DSPTElevatorCell.h
//  Dispotrains
//
//  Created by Etienne Membrives on 12/02/2014.
//  Copyright (c) 2014 Etienne Membrives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSPTElevatorCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *positionLabel;
@property (nonatomic, weak) IBOutlet UILabel *directionLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UILabel *updateLabel;
@end
