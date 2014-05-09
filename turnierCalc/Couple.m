//
//  Couple.m
//  turnierCalc
//
//  Created by Daniel Schmidt on 22.04.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import "Couple.h"
#import "Rating.h"

@implementation Couple

+ (Couple *) initWithName:(NSString *)name
{
    Couple * couple = [[Couple alloc] init];

    couple.name = name;
    couple.ratings = [[NSMutableArray alloc] init];
    return couple;
}

- (void) addRating:(Rating *)rating
{
    [_ratings addObject:rating];
}

- (float) getPlace
{
    float placeSum = 0;

    for (NSInteger currentId = 0; currentId < [_ratings count]; currentId++)
    {
        placeSum = placeSum + [_ratings[currentId] calculateRang];
    }

    float place;
    if ([_ratings count] > 0)
    {
        place = placeSum / [_ratings count];
    }

    NSLog(@"%f", place);

    return place;
}

- (NSComparisonResult) compare:(Couple *)otherObject
{
    return [[NSNumber numberWithFloat:[self getPlace]] compare:[NSNumber numberWithFloat:[otherObject getPlace]]];
}

- (void) resetRating
{
    _ratings = [[NSMutableArray alloc] init];
}

- (void) dropLatestRating
{
    [_ratings removeLastObject];
}

- (Rating *) getLatestRating
{
    return [_ratings lastObject];
}

@end
