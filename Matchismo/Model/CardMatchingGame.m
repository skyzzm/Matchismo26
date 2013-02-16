//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Zheming Zheng on 1/20/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()
@property(nonatomic)NSMutableArray *otherCards;

@property(nonatomic, strong)Deck *deck;
@end

@implementation CardMatchingGame


-(void)removeCard:(NSArray *)cards{
    for (Card *card in cards) {
        [self.cards removeObject:card];
    }
}

-(NSUInteger) cardNumber
{
    return [self.cards count];
}
-(NSUInteger)moreCard:(NSUInteger) count
{
    int i=0;
    for ( i=0; i<count; i++) {
        Card *card =[self.deck drawRandomCard];
        if (!card) {
            break;
        }else{
            [self.cards addObject:card];
        }

    }
        return i;
}

-(NSUInteger)cardIndex:(Card *) card
{
    return [self.cards indexOfObject:card];
}


-(NSMutableArray *)matchedCards
{
    if (!_matchedCards) {
        _matchedCards=[[NSMutableArray alloc] init];
    }
    return _matchedCards;
}






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

#define CARD_NUM 81
#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define THREE_MISMATCH_PENALTY 4

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self=[super init];
    self.totalNumbercard= CARD_NUM;
    if (self) {
        self.deck=deck;
        
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



-(void)flipCardAtIndex:(NSUInteger)index matchingNumber:(NSUInteger)matchingNumber
{
    self.matchedCards=nil;
    
    if (matchingNumber==3) {
        Card *card = [self cardAtIndex:index];
        
        if (!card.isUnplayable) {
            if (!card.isFaceUp) {
                //find all the cards is faceup and playable
                self.otherCards = nil;
                
                for (Card *otherCard in self.cards) {
                    if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                        [self.otherCards addObject:otherCard];
                    }
                } //in 3 card matching, the match starts when 3 cards are flipped
                if ([self.otherCards count]==2) {
                    self.Matchscore = [card match:self.otherCards];
                    if (self.Matchscore ) {
                        [self.matchedCards addObject:card];
                        for (Card * othercard in self.otherCards) {
                            othercard.unplayable=YES; //cards are unplayable
                            [self.matchedCards addObject:othercard];
                            
                        }
                        card.unplayable=YES;
                        self.score +=self.Matchscore  * MATCH_BONUS;
                        //if matched, update the result label
                        
                    }else{
                        for (Card * othercard in self.otherCards) {
                            othercard.faceUp=NO;;
                        }
                        self.score -= THREE_MISMATCH_PENALTY;
                        //if mismatched, update the result label
                        
                    }
                }
                self.score -=FLIP_COST;
            }
            card.faceUp = !card.isFaceUp;
        }
        
    }
    else{
        Card *card = [self cardAtIndex:index];
        
        if (!card.isUnplayable) {
            if (!card.isFaceUp) {
                //when a card is flipped, update the text label.
                [self.flipResults addObject:[NSString stringWithFormat:@"Flipped up %@",card.contents]];
                
                self.otherCards = nil;
                
                for (Card *otherCard in self.cards) {
                    if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                        self.Matchscore = [card match:@[otherCard]]; //get match score
                        if (self.Matchscore) {
                            [self.matchedCards addObject:card];
                            otherCard.unplayable=YES;
                            card.unplayable=YES;
                            self.score +=self.Matchscore * MATCH_BONUS;
                            //if matched, update the result label
                            [self.flipResults addObject: [NSString stringWithFormat:@"Matched %@ & %@ for %d points",card.contents, otherCard.contents, MATCH_BONUS]];
                            [self.matchedCards addObject:otherCard];
                        }else{
                            otherCard.faceUp=NO;
                            self.score -= MISMATCH_PENALTY;
                            //if mismatched, update the result label
                            [self.flipResults addObject:[NSString stringWithFormat:@"%@ & %@ don't match! %d point penalty!",card.contents, otherCard.contents, MISMATCH_PENALTY]];
                        }
                        break;
                    }
                }
                self.score -=FLIP_COST;
            }
            card.faceUp = !card.isFaceUp;
        }
        
        
        
        
    }
}










-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count)? self.cards[index]:nil;
}

@end
