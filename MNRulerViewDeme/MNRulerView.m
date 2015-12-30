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
@interface MNRulerView () <UITableViewDelegate,UITableViewDataSource>{
  
}

@property (nonatomic, strong) MNRulerTableView *tableView;

@end

@implementation MNRulerView
-(void)initInnerView:(CGRect)frame{
  
  CGFloat w = frame.size.width;
  CGFloat h = frame.size.height;
  _tableView = [[MNRulerTableView alloc]initWithFrame:CGRectMake(w/2-h/2,h/2-w/2, h, w)];
  _tableView.backgroundColor = [UIColor orangeColor];
  
  CGAffineTransform rotate = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(270));
  rotate = CGAffineTransformScale(rotate,1,1);
  [_tableView setTransform:rotate];

  _tableView.delegate = self;
  _tableView.dataSource = self;
  
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 1;
  
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
  if(cell ==nil){
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
  }
  cell.backgroundColor = [UIColor whiteColor];
  return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
