//
//  Couple.h
//  turnierCalc
//
//  Created by Daniel Schmidt on 22.04.14.
//  Copyright (c) 2014 Daniel Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Couple : NSObject

@property (weak, nonatomic) NSString * name;
@property (strong, nonatomic) NSMutableArray * ratings;

+ (Couple *)initWithName:(NSString*)name;

@end
