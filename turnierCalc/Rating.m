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

- (float)calculateRang
{
    // TODO: Write tests for this!
    // FIXME: An error is thrown here
    // Detect majority
    for (int rating = 0; rating < 7; rating ++) {
        int count = 0;
        for (int index = 0; index < ([_value length] - 1); index++) {
            if ([[_value substringWithRange:NSMakeRange(index, index + 1)] intValue] == rating)
            {
                count ++;
            }
        }
        if (count > ceil(([_value length] / 2)))
        {
            return rating;
        }
    }
    
    // No majority detected, let's use the average
    int points = 0;
    for (int index = 0; index < [_value length]; index++) {
        points += [[_value substringWithRange:NSMakeRange(index, index + 1)] intValue];
    }
    
    return (points / [_value length]);
}


@end
