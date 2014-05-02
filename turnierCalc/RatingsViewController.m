//
//  RatingsViewController.m
//  turnierCalc
//
//  Created by Daniel Schmidt on 22.04.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import "RatingsViewController.h"
#import "MasterViewController.h"
#import "Couple.h"
#import "Rating.h"

@interface RatingsViewController ()

@end

@implementation RatingsViewController

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
    // Do any additional setup after loading the view.
    [_resultsLabel setText:@""];
    _position = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addRating:(id)sender {
    NSLog(@"Add");

    // TODO: Add a rating
    Rating * rating = [Rating initWithValue:[_ratingsTextField text]];
    
    
    // TODO: Recalculate result
    [self resetDesign];
}

- (void) resetDesign {
    [_resultsLabel setText:@""];
    [_ratingsTextField setText:@""];
}

- (IBAction)resetRatings:(id)sender {
    NSLog(@"Reset");
    [self resetDesign];
    // TODO: Reset the ratings
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
