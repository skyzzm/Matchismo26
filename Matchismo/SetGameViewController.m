//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Zheming Zheng on 1/12/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetPlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "PlayingCardView.h"
#import "PlayingCardCollectionViewCell.h"
#import "SetPlayingCard.h"
#import "SetGameCollectionViewCell.h"
#import "SetCardView.h"
@interface SetGameViewController ()

@end

@implementation SetGameViewController

- (Deck *)createDeck
{
    return [[SetPlayingCardDeck alloc] init];
}

- (NSUInteger)startingCardCount
{
    return 12;
}


- (NSUInteger)matchingNumber
{
    return 3;
}




- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    if ([cell isKindOfClass:[SetGameCollectionViewCell class]]) {
        SetCardView *playingCardView = ((SetGameCollectionViewCell *)cell).playingCardView;
        if ([card isKindOfClass:[SetPlayingCard class]]) {
            SetPlayingCard *playingCard = (SetPlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.shading = playingCard.shading;
            playingCardView.shape=playingCard.shape;
            playingCardView.color=playingCard.color;
            playingCardView.faceUp = playingCard.isFaceUp;
            playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}



@end
