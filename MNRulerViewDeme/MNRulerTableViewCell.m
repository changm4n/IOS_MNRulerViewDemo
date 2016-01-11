//
//  MNRulerTableViewCell.m
//  MNRulerViewDeme
//
//  Created by 이창민 on 2015. 12. 31..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "MNRulerTableViewCell.h"
#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@implementation MNRulerTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  
  if (self) {
    
    
    
    ///////////Label///////////
    ///////////////////////////
    _label = [[UILabel alloc]init];
    _label.text = @"1";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor clearColor];
    _label.textColor = [UIColor whiteColor];
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
    rotate = CGAffineTransformScale(rotate,1,1);
    [_label setTransform:rotate];
    [self addSubview:_label];
    
    ///////////////////////////
    ///////////////////////////
    
    
    
    
    
    ///////////Lines///////////
    ///////////////////////////

    _small_Line1 = [[UIView alloc]init];
    _small_Line2 = [[UIView alloc]init];
    _small_Line3 = [[UIView alloc]init];
    _small_Line4 = [[UIView alloc]init];
    _small_Line5 = [[UIView alloc]init];
    _small_Line6 = [[UIView alloc]init];
    _small_Line7 = [[UIView alloc]init];
    _small_Line8 = [[UIView alloc]init];
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:_small_Line1,_small_Line2,_small_Line3,_small_Line4,_small_Line5,_small_Line6,_small_Line7,_small_Line8, nil];
    
    [array enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
      
      obj.backgroundColor = [UIColor whiteColor];
      [self addSubview:obj];
  
    }];
    
    
    
    _mid_Line = [[UIView alloc]init];
    _mid_Line.backgroundColor = [UIColor whiteColor];
    [self addSubview:_mid_Line];
    
    _large_Line = [[UIView alloc]init];
    _large_Line.backgroundColor = [UIColor whiteColor];
    [self addSubview:_large_Line];
    
    ///////////////////////////
    ///////////////////////////
    
    
    self.backgroundColor = [UIColor orangeColor];
    
    
    
  }
  return self;
}


-(void)setBackgroundColorOfCell:(UIColor *)backgroundColor{
  self.backgroundColor = backgroundColor;
  
}
-(void)setBackgroundColorOfLine:(UIColor *)backgroundColor{
  NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:_small_Line1,_small_Line2,_small_Line3,_small_Line4,_small_Line5,_small_Line6,_small_Line7,_small_Line8,_mid_Line,_large_Line ,nil];
  
  [array enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
    
    obj.backgroundColor = backgroundColor;
    [self addSubview:obj];
    
  }];

  
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

@end
