//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Zheming Zheng on 1/20/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
@property(nonatomic)NSUInteger totalNumbercard;
-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;
@property (strong, nonatomic) NSMutableArray *cards;
@property(nonatomic) int score;

@property(nonatomic)NSMutableArray *matchedCards;

-(Card *)cardAtIndex:(NSUInteger)index;
-(void)flipCardAtIndex:(NSUInteger)index matchingNumber:(NSUInteger)matchingNumber;

-(void)removeCard:(NSArray *)cards;
@property (nonatomic)NSUInteger cardNumber;
-(NSUInteger)moreCard:(NSUInteger) count;
-(NSUInteger)cardIndex:(Card *) card;
@property(nonatomic)int Matchscore;
@property(nonatomic, readonly)NSMutableArray *flipResults;

@end
