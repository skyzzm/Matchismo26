//
//  SetPlayingCard.h
//  Matchismo
//
//  Created by Zheming Zheng on 1/28/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetPlayingCard : NSObject

@property(strong,nonatomic)NSString *suit;
@property(strong,nonatomic)NSString *colors;
@property(strong,nonatomic)NSString *shading;
@property(nonatomic)NSUInteger rank;

+(NSArray *)validSuits;
+(NSArray *)validColors;
+(NSArray *)validShadings;
+(NSUInteger)maxRank;

@end
