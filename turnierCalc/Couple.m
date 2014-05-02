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

+ (Couple *)initWithName:(NSString*)name
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

- (NSIndexSet *)getPlace
{
    return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1,2)];
}

- (void) resetRating
{
    _ratings = [[NSMutableArray alloc] init];
}

@end
