//
//  MNRulerTableView.m
//  MNRulerViewDeme
//
//  Created by 이창민 on 2015. 12. 30..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "MNRulerTableView.h"


@interface MNRulerTableView (){
  
}

@end
@implementation MNRulerTableView

-(instancetype)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rowHeight = 60;
    
  }
  return self;
}

-(void)setRowHeight:(CGFloat)rowHeight{
  self.rowHeight = rowHeight;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
