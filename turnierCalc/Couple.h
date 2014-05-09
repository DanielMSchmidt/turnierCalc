//
//  Couple.h
//  turnierCalc
//
//  Created by Daniel Schmidt on 22.04.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rating.h"

@interface Couple : NSObject

@property (weak, nonatomic) NSString * name;
@property (strong, nonatomic) NSMutableArray * ratings;

+ (Couple *) initWithName:(NSString *)name;

- (void) addRating:(Rating *)rating;
- (float) getPlace;
- (void) resetRating;
- (void) dropLatestRating;
- (Rating *) getLatestRating;
- (NSComparisonResult) compare:(Couple *)otherObject;
@end
