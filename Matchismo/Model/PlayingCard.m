//
//  PlayingCard.m
//  Matchismo
//
//  Created by Zheming Zheng on 1/12/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)otherCards
{
    int score =0;
    if (otherCards.count==1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score =2;
        }else if (otherCard.rank==self.rank){
            score=4;
        }
    }
    
    else if (otherCards.count==2) {
        PlayingCard *otherCard1= otherCards [0];
        PlayingCard *otherCard2= otherCards [1];
        if (otherCard1.rank == self.rank && otherCard2.rank==self.rank) {
            score = 9; //if all suits match, score=9
        }
        else if ([otherCard1.suit isEqualToString:self.suit] && [otherCard2.suit isEqualToString: self.suit]) {
            score = 5; //if all suits match, score =5
        }else if(otherCard1.rank == self.rank || otherCard2.rank==self.rank || otherCard1.rank == otherCard2.rank)
        {
            score = 3; //if 2 rank matches, score = 3
        }else if ([otherCard1.suit isEqualToString:self.suit] || [otherCard2.suit isEqualToString: self.suit] || [otherCard1.suit isEqualToString:otherCard2.suit])
            score=1; //if 2 suits matches, score=1
    }
    return score;
}

-(NSString *)contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@synthesize suit=_suit;

+(NSArray *)validSuits
{
    static NSArray *validSuits =nil;
    if (!validSuits) {
        validSuits= @[@"♥",@"♦",@"♠",@"♣"];
    }
    return validSuits;
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit=suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit :@"?";
}

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", @"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank{
    return [self rankStrings].count-1;
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <=[PlayingCard maxRank]) {
        _rank=rank;
    }
}
@end
