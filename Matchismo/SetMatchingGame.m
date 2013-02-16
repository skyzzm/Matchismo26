//
//  SetMatchingGame.m
//  Matchismo
//
//  Created by Zheming Zheng on 1/27/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Zheming Zheng on 1/20/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "SetMatchingGame.h"

@interface SetMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property(nonatomic) int score;
@property(nonatomic)NSMutableArray *otherCards;
@property(nonatomic)int Matchscore;

@end

@implementation SetMatchingGame


-(NSMutableArray *)otherCards
{
    if (!_otherCards) {
        _otherCards=[[NSMutableArray alloc] init];
    }
    return _otherCards;
}


-(NSMutableArray *)cards
{
    if(!_cards){
        _cards=[[NSMutableArray alloc] init];
    }
    return _cards;
}

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self=[super init];
    
    if (self) {
        for (int i=0; i< count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self=nil;
            }else{
                self.cards[i]=card;
            }
        }
    }
    return self;
}




-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count)? self.cards[index]:nil;
}

@end

