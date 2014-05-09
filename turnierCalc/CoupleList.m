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
    static CoupleList * sharedCoupleList = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedCoupleList = [[self alloc] init];
    });
    return sharedCoupleList;
}

- (id) init
{
    if (self = [super init])
    {
        _couples = [[NSMutableArray alloc] init];
        _position = 0;
        _ratingCount = 0;
        _lengthOfRatings = 0;
    }
    return self;
}

- (void) addCouple:(Couple *)couple
{
    [_couples insertObject:couple atIndex:[_couples count]];
    [self resetRatings];
    [self updateRang];
}

- (NSInteger) count
{
    return [_couples count];
}

- (Couple *) getCoupleAtIndex:(NSInteger)index
{
    Couple * couple = _couples[index];

    return couple;
}

- (void) removeCoupleAtIndex:(NSInteger)index
{
    [_couples removeObjectAtIndex:index];
}

- (BOOL) addRating:(Rating *)rating
{
    if (_lengthOfRatings == 0)
    {
        _lengthOfRatings = [rating length];
    }
    else if (_lengthOfRatings != [rating length])
    {
        return NO;
    }

    [[self activeCouple] addRating:rating];

    _position++;
    _ratingCount++;

    if (_position >= [self count])
    {
        _position = 0;
        [self updateRang];
    }
    return YES;
}

- (void) resetRatings
{
    for (Couple * couple in _couples)
    {
        [couple resetRating];
    }
    _position = 0;
    _ratingCount = 0;
    _lengthOfRatings = 0;
}

- (NSInteger) coupleCount
{
    return [_couples count];
}

- (void) undoRating
{
    if (_ratingCount != 0)
    {
        _position = (_position - 1) % [self count];
        [[self activeCouple] dropLatestRating];
    }

}


- (NSArray *) getPlacedCouplesReadyToDisplay
{
    return [[NSArray alloc] initWithArray:_couplesReadyToDisplay];
}

- (Rating *) lastRating
{
    return [[self activeCouple] getLatestRating];
}

- (void) updateRang
{
    NSArray * orderedCouples = [_couples sortedArrayUsingSelector:@selector(compare:)];

    NSMutableArray * newRang = [[NSMutableArray alloc] init];
    int printRang = 0;
    int missedRang = 0;

    for (int i = 0; i < [orderedCouples count]; i++)
    {
        float thisCouplePlace = [[orderedCouples objectAtIndex:i] getPlace];
        if (i != 0 && thisCouplePlace == [[orderedCouples objectAtIndex:(i - 1)] getPlace])
        {
            NSLog(@"At least two have the same place");
            missedRang++;
        }
        else
        {
            printRang += (missedRang + 1);
            missedRang = 0;
        }

        [newRang addObject:
         [GRMustacheTemplate
          renderObject:@{
                         @"name": [[orderedCouples objectAtIndex:i] name],
                         @"place": [NSString stringWithFormat:@"%d", printRang]
                         }
          fromString:placingTemplateString
          error:NULL]];
    }

    _couplesReadyToDisplay = newRang;

}

- (Couple *) activeCouple
{
    return _couples[_position];
}

@end
