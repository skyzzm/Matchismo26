//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Zheming Zheng on 1/12/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "PlayingCardView.h"
#import "PlayingCardCollectionViewCell.h"
#import "PlayingCard.h"
#import "SetGameCollectionViewCell.h"
@interface CardGameViewController ()

@end

@implementation CardGameViewController

- (Deck *)createDeck
{
    
    return [[PlayingCardDeck alloc] init];
}






- (NSUInteger)matchingNumber
{
    return 2;
}




- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
        PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).playingCardView;
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            playingCardView.faceUp = playingCard.isFaceUp;
            playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}



@end
