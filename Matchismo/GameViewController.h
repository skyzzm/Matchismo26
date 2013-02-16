//
//  GameViewController.h
//  Matchismo
//
//  Created by Zheming Zheng on 1/31/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"



@interface GameViewController : UIViewController

// all of the following methods must be overriden by concrete subclasses
- (Deck *)createDeck; // abstract

@property (readonly, nonatomic) NSUInteger matchingNumber;
@property (nonatomic) NSUInteger startingCardCount; // abstract

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card; // abstract
@end


