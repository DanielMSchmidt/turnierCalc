//
//  Rating.h
//  turnierCalc
//
//  Created by Daniel Schmidt on 01.05.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rating : NSObject

@property (strong, nonatomic) NSString * value;
+ (Rating *) initWithValue:(NSString *)value;
- (float) calculateRang;
- (int) length;
@end
