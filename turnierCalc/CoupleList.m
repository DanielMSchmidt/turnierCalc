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

NSString * const placingTemplateString = @"{{name}}: {{place}}. Platz \n";

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

    _position = (_position + 1) % [self count];
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


- (NSString *) getPlaceForCoupleAtIndex:(NSInteger)index
{
    NSIndexSet * place = [_couples[index] getPlace];
    
    if([place firstIndex] == [place lastIndex])
    {
        return [GRMustacheTemplate renderObject:@{ @"name": [[_couples objectAtIndex:index] name], @"place": [NSString stringWithFormat:@"%d", [place firstIndex]]} fromString:placingTemplateString error:NULL];
    } else {
        return [GRMustacheTemplate renderObject:@{ @"name": [[_couples objectAtIndex:index] name], @"place": [NSString stringWithFormat:@"%d - %d", [place firstIndex], [place lastIndex]]} fromString:placingTemplateString error:NULL];
    }
}

- (Rating *) lastRating
{
    return[_couples[_position] getLatestRating];
}

@end
