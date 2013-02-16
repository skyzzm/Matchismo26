//
//  SetPlayingCard.m
//  Matchismo
//
//  Created by Zheming Zheng on 2/9/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "SetPlayingCard.h"

@implementation SetPlayingCard
-(int)match:(NSArray *)otherCards
{
    int score =0;
    //a set is defined as all the cards are same or different in each category
    if (otherCards.count==2) {
        SetPlayingCard *otherCard1= otherCards [0];
        SetPlayingCard *otherCard2= otherCards [1];
        if ((otherCard1.rank == self.rank && otherCard2.rank==self.rank)||
            (otherCard1.rank != self.rank && otherCard2.rank!=self.rank && otherCard1.rank != otherCard2.rank)) {
            if ((otherCard1.shape == self.shape && otherCard2.shape==self.shape)||
                (otherCard1.shape != self.shape && otherCard2.shape!=self.shape && otherCard1.shape != otherCard2.shape)) {
                if ((otherCard1.shading == self.shading && otherCard2.shading==self.shading)||
                    (otherCard1.shading != self.shading && otherCard2.shading!=self.shading && otherCard1.shading != otherCard2.shading)) {
                    if ((otherCard1.color == self.color && otherCard2.color==self.color)||
                        (otherCard1.color != self.color && otherCard2.color!=self.color && otherCard1.color != otherCard2.color)) {
                        score =4;
                        return score;
                    }
                }
            }
        }
    }
    return score;
}






+(NSArray *)rankStrings
{
    return @[@"?",@"1",@"2",@"3"];
}

+(NSUInteger)maxRank{
    return [self rankStrings].count-1;
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <=[SetPlayingCard maxRank]) {
        _rank=rank;
    }
}





+(NSUInteger)maxShading{
    return 3;
}

-(void)setShading:(NSUInteger)shading
{
    if (shading <=[SetPlayingCard maxShading]) {
        _shading=shading;
    }
}




+(NSUInteger)maxShape{
    return 3;
}

-(void)setShape:(NSUInteger)shape
{
    if (shape <=[SetPlayingCard maxShape]) {
        _shape=shape;
    }
}




+(NSUInteger)maxColor{
    return 3;
}

-(void)setColor:(NSUInteger)color
{
    if (color <=[SetPlayingCard maxColor]) {
        _color=color;
    }
}
@end
