//
//  GameViewController.m
//  Matchismo
//
//  Created by Zheming Zheng on 1/31/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface GameViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (strong, nonatomic) CardMatchingGame *game;
@property(nonatomic)NSUInteger count;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation GameViewController

#pragma mark - Properties



- (CardMatchingGame *)game
{
   
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck { return nil; } // abstract



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card];
    return cell;
}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    // abstract
}

#pragma mark - Updating the UI

- (void)updateUI
{
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]) {
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

#define pragma mark - Target/Action/Gestures


- (IBAction)flipCard:(UITapGestureRecognizer *)gesture
{
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        [self.game flipCardAtIndex:indexPath.item matchingNumber:self.matchingNumber];
        if (self.game.Matchscore) {
           
           
            NSMutableArray* deleteIndexes=[[NSMutableArray alloc]init];

            for (Card *card in self.game.matchedCards) {
                NSUInteger index= [self.game cardIndex:card];
                
                [deleteIndexes addObject: [NSIndexPath indexPathForItem:index inSection:0]];
            }
             self.count--;
             self.count--;
            [self.game removeCard:self.game.matchedCards];
           
    
            [self.cardCollectionView  deleteItemsAtIndexPaths:deleteIndexes];
        }
        [self updateUI];
       
    }
  
        NSLog(@"dd");
    
    
    
    
}
- (IBAction)deal:(UIButton *)sender {
    self.game = nil;
    [self.cardCollectionView reloadData];
    [self updateUI];
}

- (IBAction)addCards:(UIButton *)sender {
    if (self.game.cardNumber > self.game.totalNumbercard-3) {
        self.game = nil;
        [self.cardCollectionView reloadData];
        [self updateUI];
    }else{
    
    NSMutableArray* addIndexes=[[NSMutableArray alloc]init];
 
    [addIndexes addObject: [NSIndexPath indexPathForItem:self.game.cardNumber inSection:0]];
    [self.game moreCard:1];
    [addIndexes addObject: [NSIndexPath indexPathForItem:self.game.cardNumber inSection:0]];
    [self.game moreCard:1];
    [addIndexes addObject: [NSIndexPath indexPathForItem:self.game.cardNumber inSection:0]];
    [self.game moreCard:1];
    [self.cardCollectionView insertItemsAtIndexPaths:addIndexes];
        
        [self.cardCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.game.cardNumber-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
        
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    self.startingCardCount=22;
    self.count=22;
}

@end
