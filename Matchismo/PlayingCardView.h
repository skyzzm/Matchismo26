//
//  PlayingCardView.h
//  Matchismo
//
//  Created by Zheming Zheng on 2/7/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//  PlayingCardView.h
//  SuperCard
//
//  Created by CS193p Instructor.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;

@property (nonatomic) BOOL faceUp;
@end
