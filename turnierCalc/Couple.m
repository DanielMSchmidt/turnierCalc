//
//  Couple.m
//  turnierCalc
//
//  Created by Daniel Schmidt on 22.04.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import "Couple.h"

@implementation Couple

+ (Couple *)initWithName:(NSString*)name
{
    Couple * couple = [[Couple alloc] init];
    couple.name = name;
    return couple;
}
@end
