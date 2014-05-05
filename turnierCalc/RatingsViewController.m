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



NSString * const latestRatingPrefix = @"Letzte Wertung: ";

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
    _ratingsTextField.delegate = self;
    [self setCurrentCouple];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addRating:(id)sender {
    NSLog(@"Add");

    NSString * ratingText = [_ratingsTextField text];
    Rating * rating = [Rating initWithValue:ratingText];

    if(![[CoupleList getInstance] addRating:rating])
    {
        [self invalidRatingError];
    } else {
        [self setLatestRatingTextAs:ratingText];
    }
    
    [self resetInputs];
}

- (void) setLatestRatingTextAs:(NSString *) text
{
    [_latestRatingLabel setText:[latestRatingPrefix stringByAppendingString:text]];
}


- (void) invalidRatingError
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Wertung fehlerhaft" message:@"Sie haben eine andere Anzahl an Wertungen als sonst angegeben" delegate:self cancelButtonTitle:@"Nochmal" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

- (IBAction)undoRating:(id)sender {
    [[CoupleList getInstance] undoRating];
    NSString * ratingText;
    Rating * rating;
    if ((rating = [[CoupleList getInstance] lastRating]))
    {
        ratingText = [rating value];
    } else {
        ratingText = @"---";
    }
    
    [self setLatestRatingTextAs:ratingText];
}

- (void) resetInputs {
    [self setCurrentCouple];
    [_resultTable reloadData];
    [_ratingsTextField setText:@""];
    [_ratingsTextField resignFirstResponder];
}

- (void) setCurrentCouple
{
    NSString * text = [[[CoupleList getInstance] activeCouple] name];
    [_currentCoupleLabel setText:text];
}

- (IBAction)resetRatings:(id)sender {
    NSLog(@"Reset");

    [self setLatestRatingTextAs:@"---"];
    [[CoupleList getInstance] resetRatings];
    [self setCurrentCouple];
    [self resetInputs];    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

// UITableView Delegation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[CoupleList getInstance] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[[CoupleList getInstance] getPlacedCouplesReadyToDisplay] objectAtIndex:indexPath.row];
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [_resultTable reloadData];
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
