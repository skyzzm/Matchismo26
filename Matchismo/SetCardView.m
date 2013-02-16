//
//  SetCardView.m
//  Matchismo
//
//  Created by Zheming Zheng on 2/9/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "SetCardView.h"

@interface SetCardView()
@property (nonatomic) CGFloat faceCardScaleFactor;
@end


@implementation SetCardView

#pragma mark - Properties

@synthesize faceCardScaleFactor = _faceCardScaleFactor;

#define DEFAULT_FACE_CARD_SCALE_FACTOR 0.90

- (CGFloat)faceCardScaleFactor
{
    if (!_faceCardScaleFactor) _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    return _faceCardScaleFactor;
}

- (void)setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor
{
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}

- (void)setShading:(NSUInteger)shading
{
    _shading = shading;
    [self setNeedsDisplay];
}

- (void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setShape:(NSUInteger)shape{
    _shape = shape;
    [self setNeedsDisplay];
}

- (void)setColor:(NSUInteger)color{
    _color = color;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

- (NSString *)rankAsString
{
    return @[@"?",@"A",@"2",@"3"][self.rank];
}

#pragma mark - Drawing

#define CORNER_RADIUS 12.0

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    
    [roundedRect addClip];
    [[UIColor whiteColor] setFill];
    
    if(self.faceUp)
        [[UIColor lightGrayColor] setFill];
    
    UIRectFill(self.bounds);
    
    [self drawPips];
    
    
    
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
}

#define PIP_FONT_SCALE_FACTOR 0.20
#define CORNER_OFFSET 2.0



- (void)pushContextAndRotateUpsideDown
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}

- (void)popContext
{
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}



#pragma mark - Draw Pips

#define PIP_HOFFSET_PERCENTAGE 0.165
#define PIP_VOFFSET1_PERCENTAGE 0.090
#define PIP_VOFFSET2_PERCENTAGE 0.175
#define PIP_VOFFSET3_PERCENTAGE 0.270

- (void)drawPips
{
    if ((self.rank == 1) ) {
        [self drawPipsWithHorizontalOffset:0
                            verticalOffset:0
                                upsideDown:NO
                                     usingshape:self.shape];
    }
    if (self.rank == 2  ){
        [self drawPipsWithHorizontalOffset:0
                            verticalOffset:PIP_VOFFSET2_PERCENTAGE
                                upsideDown:NO
                                    usingshape:self.shape];
        
        [self drawPipsWithHorizontalOffset:0
                            verticalOffset:-PIP_VOFFSET3_PERCENTAGE
                                upsideDown:NO
                                      usingshape:self.shape];
    }
    
    if ((self.rank == 3) ){
        [self drawPipsWithHorizontalOffset:0
                            verticalOffset:-PIP_VOFFSET3_PERCENTAGE
                                upsideDown:NO
                                      usingshape:self.shape];
        [self drawPipsWithHorizontalOffset:0
                            verticalOffset:0
                                upsideDown:NO
                                   usingshape:self.shape];
        [self drawPipsWithHorizontalOffset:0
                            verticalOffset:PIP_VOFFSET3_PERCENTAGE
                                upsideDown:NO
                                    usingshape:self.shape];
    }
        
        
        
}

#define sizeLimitation 7

- (void)drawPipsWithHorizontalOffset:(CGFloat)hoffset
                      verticalOffset:(CGFloat)voffset
                          upsideDown:(BOOL)upsideDown
                          usingshape:(NSUInteger)shape
{
    if (shape==1) {
        UIBezierPath *path=[[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2-sizeLimitation+voffset*self.bounds.size.height)];
        [path addLineToPoint:CGPointMake(self.bounds.size.width/2-sizeLimitation,self.bounds.size.height/2+sizeLimitation+voffset*self.bounds.size.height)];
        [path addLineToPoint:CGPointMake(self.bounds.size.width/2+sizeLimitation,self.bounds.size.height/2+sizeLimitation+voffset*self.bounds.size.height)];
        [path closePath];
       
        [self fillColor:path];
        
    }if (shape==2) {
        UIBezierPath *path=[[UIBezierPath alloc] init];
        
        [path moveToPoint:CGPointMake(self.bounds.size.width/2-sizeLimitation,self.bounds.size.height/2-sizeLimitation+voffset*self.bounds.size.height)];
        
        [path addLineToPoint:CGPointMake(self.bounds.size.width/2-sizeLimitation,self.bounds.size.height/2+sizeLimitation+voffset*self.bounds.size.height)];
        
    
        [path addLineToPoint:CGPointMake(self.bounds.size.width/2+sizeLimitation,self.bounds.size.height/2+sizeLimitation+voffset*self.bounds.size.height)];

        
         [path addLineToPoint:CGPointMake(self.bounds.size.width/2+sizeLimitation,self.bounds.size.height/2-sizeLimitation+voffset*self.bounds.size.height)];
       
        [path addLineToPoint:CGPointMake(self.bounds.size.width/2+sizeLimitation,self.bounds.size.height/2-sizeLimitation+voffset*self.bounds.size.height)];

        [path closePath];
        [self fillColor:path];
        
    }if (shape==3) {
        UIBezierPath *path=[[UIBezierPath alloc] init];
        [path moveToPoint:CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2-sizeLimitation+voffset*self.bounds.size.height)];
       
      CGPoint middle = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2+voffset*self.bounds.size.height);
        
        [path addArcWithCenter:middle radius:sizeLimitation startAngle:0 endAngle:360 clockwise:YES];
        
        [self fillColor:path];
    }
}


-(void)fillColor: (UIBezierPath *) path
{
    double alpha=0;
    if(self.shading==1){
        alpha= 0;
    }
    if(self.shading==2){
        alpha= 0.3;
    }
    if(self.shading==1){
        alpha= 0.7;
    }
    
    
    if(self.color==1){
        [[UIColor greenColor ] setStroke];

        [[[UIColor greenColor ]colorWithAlphaComponent:alpha] setFill];
    }
    
    if(self.color==2){
             [[UIColor redColor ] setStroke];
        [[[UIColor redColor]colorWithAlphaComponent:alpha]setFill];
    }
    
    if(self.color==3){
           [[UIColor purpleColor] setStroke];
        [[[UIColor purpleColor]colorWithAlphaComponent:alpha]setFill];
    }
     [path fill];
    [path stroke];
}



#pragma mark - Initialization

- (void)setup
{
    // do initialization here
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
