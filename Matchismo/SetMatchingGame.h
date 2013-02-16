//
//  SetMatchingGame.h
//  Matchismo
//
//  Created by Zheming Zheng on 1/27/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "SetPlayingCard.h"

@interface SetMatchingGame : NSObject

-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;




-(Card *)cardAtIndex:(NSUInteger)index;

@property(nonatomic, readonly)int score;
@property(nonatomic,readonly)NSMutableArray *otherCards;
@property(nonatomic, readonly)int Matchscore;
@end
