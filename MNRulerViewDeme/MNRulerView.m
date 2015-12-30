//
//  MNRulerView.m
//  MNRulerViewDeme
//
//  Created by 이창민 on 2015. 12. 30..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "MNRulerView.h"
#import "MNRulerTableView.h"
#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)
@interface MNRulerView (){
  
}

@property (nonatomic, strong) MNRulerTableView *tableView;

@end

@implementation MNRulerView
-(void)initInnerView:(CGRect)frame{
  
  CGFloat w = frame.size.width;
  CGFloat h = frame.size.height;
  _tableView = [[MNRulerTableView alloc]initWithFrame:CGRectMake(w/2-h/2,h/2-w/2, h, w) style:UITableViewStylePlain];
  _tableView.backgroundColor = [UIColor redColor];
  
  CGAffineTransform rotate = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(270));
  rotate = CGAffineTransformScale(rotate,1,1);
  [_tableView setTransform:rotate];

  
  [self addSubview:_tableView];
  
}

-(instancetype)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if(self){
    [self initInnerView:frame];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  
  if (self) {
    [self initInnerView:self.frame];
  }
  
  return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
