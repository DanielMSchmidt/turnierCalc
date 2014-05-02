//
//  CoupleList.h
//  turnierCalc
//
//  Created by Daniel Schmidt on 02.05.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Couple.h"

@interface CoupleList : NSObject
@property (strong, nonatomic) NSMutableArray *couples;

+ (CoupleList *) getInstance;

- (void) addCouple:(Couple *)couple;
- (NSInteger) count;
- (Couple *) getCoupleAtIndex:(NSInteger)index;
- (void) removeCoupleAtIndex:(NSInteger)index;
@end
