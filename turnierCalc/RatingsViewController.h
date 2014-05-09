//
//  RatingsViewController.h
//  turnierCalc
//
//  Created by Daniel Schmidt on 22.04.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingsViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField * ratingsTextField;
@property (weak, nonatomic) IBOutlet UILabel * latestRatingLabel;
extern NSString * const latestRatingPrefix;
@property (weak, nonatomic) IBOutlet UITableView * resultTable;
@property (weak, nonatomic) IBOutlet UILabel * currentCoupleLabel;


- (IBAction) resetRatings:(id)sender;
@end
