//
//  SetGameCollectionViewCell.h
//  Matchismo
//
//  Created by Zheming Zheng on 2/8/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCardView.h"

@interface SetGameCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet SetCardView *playingCardView;

@end
