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
    [[self activeCouple] addRating:rating];

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
    [[self activeCouple] dropLatestRating];
}


- (NSArray *) getPlacedCouplesReadyToDisplay
{
    return [[NSArray alloc] initWithArray:_couplesReadyToDisplay];
}

- (Rating *) lastRating
{
    return[[self activeCouple] getLatestRating];
}

- (void) updateRang
{
    NSArray * orderedCouples = [_couples sortedArrayUsingSelector:@selector(compare:)];
    
    // TODO: Support groupings if same place (http://stackoverflow.com/questions/2767164/objective-c-create-arrays-from-first-array-based-on-value)
    NSMutableArray * newRang = [[NSMutableArray alloc] init];
    int printRang = 0;
    int missedRang = 0;
    for(int i = 0; i < [orderedCouples count]; i++)
    {
        float thisCouplePlace = [[orderedCouples objectAtIndex:i] getPlace];
        if (i != 0 && thisCouplePlace == [[orderedCouples objectAtIndex:(i - 1)] getPlace])
        {
            float last = [[orderedCouples objectAtIndex:(i - 1)] getPlace];
            NSLog(@"At least two have the same place");
            missedRang++;
        } else {
            printRang += (missedRang + 1);
            missedRang = 0;
        }
        
        [newRang addObject:
            [GRMustacheTemplate
                renderObject:@{
                        @"name": [[orderedCouples objectAtIndex:i] name],
                        @"place": [NSString stringWithFormat:@"%d", printRang]}
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
