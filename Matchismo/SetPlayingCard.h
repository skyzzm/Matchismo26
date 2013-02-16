//
//  SetPlayingCard.h
//  Matchismo
//
//  Created by Zheming Zheng on 2/9/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "Card.h"

@interface SetPlayingCard : Card

@property(nonatomic)NSUInteger shading;
@property(nonatomic)NSUInteger rank;
@property(nonatomic)NSUInteger shape;
@property(nonatomic)NSUInteger color;

+(NSUInteger)maxShading;
+(NSUInteger)maxRank;
+(NSUInteger)maxShape;
+(NSUInteger)maxColor;
@end
