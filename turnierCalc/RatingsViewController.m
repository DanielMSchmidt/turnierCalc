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
    _ratingsTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addRating:(id)sender {
    NSLog(@"Add");

    Rating * rating = [Rating initWithValue:[_ratingsTextField text]];
    [[CoupleList getInstance] addRating:rating];
    
    [self resetInputs];
    [self setPlaceText];
}

- (void) setPlaceText {
    NSString *text = @"";
    CoupleList * cl = [CoupleList getInstance];
    
    for (NSInteger i = 0; i < [cl coupleCount]; i++) {
        text = [text stringByAppendingString:[cl getPlaceForCoupleAtIndex:i]];
    }
    
    [_resultsLabel setText:text];
}

- (void) resetInputs {
    [_resultsLabel setText:@""];
    [_ratingsTextField setText:@""];
    [_ratingsTextField resignFirstResponder];
}

- (IBAction)resetRatings:(id)sender {
    NSLog(@"Reset");
    [self resetInputs];
    [[CoupleList getInstance] resetRatings];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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
