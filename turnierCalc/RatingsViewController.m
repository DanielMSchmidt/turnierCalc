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
    NSLog(@"well");
    NSString * text = [_ratingsTextField text];
    [_ratingsTextField setText:@""];
    MasterViewController *vc = [self.tabBarController.viewControllers objectAtIndex:0];
    NSLog(@"me workds");
    //Couple * c = [[vc objects] objectAtIndex:0];
    //[c.ratings addObject:text];
    //NSLog(@"added => %@", c.ratings);
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
