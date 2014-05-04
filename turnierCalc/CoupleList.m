//
//  CoupleList.m
//  turnierCalc
//
//  Created by Daniel Schmidt on 02.05.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import "CoupleList.h"
#import "GRMustache.h"

@implementation CoupleList

NSString * const placingTemplateString = @"{{place}}. - {{name}}";

+ (CoupleList *) getInstance
{
    static CoupleList *sharedCoupleList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCoupleList = [[self alloc] init];
    });
    return sharedCoupleList;
}

-(id) init
{
    if(self = [super init])
    {
        _couples = [[NSMutableArray alloc] init];
        _position = 0;
        
    }
    return self;
}

- (void) addCouple:(Couple *)couple
{
    [_couples insertObject:couple atIndex:[_couples count]];
    [self updateRang];
}

- (NSInteger) count
{
    return [_couples count];
}

- (Couple *) getCoupleAtIndex:(NSInteger)index
{
    Couple * couple =_couples[index];
    return couple;
}

- (void) removeCoupleAtIndex:(NSInteger)index
{
    [_couples removeObjectAtIndex:index];
}

- (void) addRating:(Rating *)rating
{
    [_couples[_position] addRating:rating];

    _position++;
    if(_position >= [self count])
    {
        _position = 0;
        [self updateRang];
    }
}

- (void) resetRatings
{
    for (Couple  * couple in _couples) {
        [couple resetRating];
    }
}

- (NSInteger) coupleCount
{
    return [_couples count];
}

- (void) undoRating
{
    _position = (_position - 1) % [self count];
    [_couples[_position] dropLatestRating];
}


- (NSArray *) getPlacedCouplesReadyToDisplay
{
    //return [GRMustacheTemplate renderObject:@{ @"name": [[_couples objectAtIndex:index] name], @"place": [NSString stringWithFormat:@"%f", place]} fromString:placingTemplateString error:NULL];
    
    return [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
}

- (Rating *) lastRating
{
    return[_couples[_position] getLatestRating];
}

- (void) updateRang
{
    // TODO
    
}

@end
