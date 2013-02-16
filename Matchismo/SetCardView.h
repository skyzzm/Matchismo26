//
//  SetCardView.h
//  Matchismo
//
//  Created by Zheming Zheng on 2/9/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (nonatomic) NSUInteger shape;
@property (nonatomic) NSUInteger color;

@property (nonatomic) NSUInteger shading;

@property (nonatomic) BOOL faceUp;

@end
