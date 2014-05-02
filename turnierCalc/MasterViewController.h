//
//  MasterViewController.h
//  turnierCalc
//
//  Created by Daniel Schmidt on 22.04.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoupleList.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController
@property (nonatomic) CoupleList * couples;
@end
