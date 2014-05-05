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
@property (strong, nonatomic) NSMutableArray * couples;
@property (strong, nonatomic) NSMutableArray * couplesReadyToDisplay;
@property (nonatomic) NSInteger position;
@property (nonatomic) NSInteger ratingCount;
extern NSString * const placingTemplateString;

+ (CoupleList *) getInstance;

- (void) addCouple:(Couple *)couple;
- (NSInteger) count;
- (Couple *) getCoupleAtIndex:(NSInteger)index;
- (void) removeCoupleAtIndex:(NSInteger)index;
- (void) addRating:(Rating *)rating;
- (void) undoRating;
- (void) resetRatings;
- (NSInteger) coupleCount;
- (Rating *) lastRating;
- (NSArray *) getPlacedCouplesReadyToDisplay;
- (void) updateRang;
- (Couple *) activeCouple;
@end
