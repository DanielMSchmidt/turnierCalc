//
//  Rating.m
//  turnierCalc
//
//  Created by Daniel Schmidt on 01.05.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import "Rating.h"

@implementation Rating

+ (Rating *)initWithValue:(NSString *)value
{
    Rating * rating = [[Rating alloc] init];
    rating.value = value;
    return rating;
}

- (NSIndexSet *)calculateRang
{
    return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1,2)];
}

@end
