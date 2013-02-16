//
//  SetPlayingCardDeck.m
//  Matchismo
//
//  Created by Zheming Zheng on 1/28/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//
#import "SetPlayingCardDeck.h"
#import "SetPlayingCard.h"

@implementation SetPlayingCardDeck

-(id)init
{
    self =[super init];
    if (self) {
        for (NSUInteger shading=1; shading<=[SetPlayingCard maxShading];shading++) {
            for (NSUInteger rank =1; rank<=[SetPlayingCard maxRank]; rank++) {
                for (NSUInteger shape =1; shape<=[SetPlayingCard maxShape]; shape++) {
                     for (NSUInteger color =1; color<=[SetPlayingCard maxColor]; color++) {
                SetPlayingCard *card =[[SetPlayingCard alloc] init];
                card.rank=rank;
                card.shape=shape;
                card.shading =shading;
                          card.color =color;
                [self addCard:card atTop:YES];
                     }
                }
            }
        }
    }
    return self;
}

@end