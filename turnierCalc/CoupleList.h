//
//  CoupleList.h
//  turnierCalc
//
//  Created by Daniel Schmidt on 02.05.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Couple.h"
#import "Rating.h"


@interface CoupleList : NSObject
@property (strong, nonatomic) NSMutableArray *couples;
@property (nonatomic) NSInteger position;
extern NSString * const placingTemplateString;

+ (CoupleList *) getInstance;

- (void) addCouple:(Couple *)couple;
- (NSInteger) count;
- (Couple *) getCoupleAtIndex:(NSInteger)index;
- (void) removeCoupleAtIndex:(NSInteger)index;
- (void) addRating:(Rating *)rating;
- (void) undoRating;
- (void) resetRatings;
- (NSString *) getPlaceForCoupleAtIndex:(NSInteger)index;
- (NSInteger) coupleCount;
- (Rating *) lastRating;
- (NSMutableArray *) placesForCouples;
@end
