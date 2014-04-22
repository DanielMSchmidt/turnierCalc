//
//  RatingsViewController.h
//  turnierCalc
//
//  Created by Daniel Schmidt on 22.04.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ratingsTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@property (nonatomic) NSUInteger position;

@end
