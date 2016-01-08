//
//  MNRulerView.m
//  MNRulerViewDeme
//
//  Created by 이창민 on 2015. 12. 30..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "MNRulerView.h"
#import "MNRulerTableView.h"
#import "MNRulerTableViewCell.h"
#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)
#define SMALL_LINE_WIDTH 1
#define MID_LINE_WIDTH 1
#define LARGE_LINE_WIDTH 3
#define LABEL_SIZE 30

@interface MNRulerView () <UITableViewDelegate,UITableViewDataSource>{
  
}
@property (nonatomic) IBInspectable NSInteger minValue;
@property (nonatomic) IBInspectable NSInteger maxValue;

@property (nonatomic) float rowHeight;
@property (nonatomic) float rowWidth;

@property (nonatomic, strong) MNRulerTableView *tableView;

@end

@implementation MNRulerView
-(void)initInnerView:(CGRect)frame{
  
  CGFloat w = frame.size.width;
  CGFloat h = frame.size.height;
  
  if (!_rowHeight) {
    _rowHeight = 100;
  }
  _rowWidth = frame.size.height;
  
  _tableView = [[MNRulerTableView alloc]initWithFrame:CGRectMake(w/2-h/2,h/2-w/2, h, w)];
  
  _tableView.delegate = self;
  _tableView.dataSource = self;
  
  
  
  
  
  CGAffineTransform rotate = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(270));
  rotate = CGAffineTransformScale(rotate,1,1);
  [_tableView setTransform:rotate];
  
  
  [self addSubview:_tableView];
  [_tableView reloadData];
  
  
}


-(void)setMaxValue:(NSInteger)maxValue MinValue:(NSInteger)minValue{
  _maxValue = maxValue;
  _minValue = minValue;
  
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
  
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


-(void)setIndicatorView:(UIView *)view{
  
  CGRect originRect = view.frame;
  originRect.origin.x = ceil((self.frame.size.width - originRect.size.width)/2);
  
  view.frame = originRect;
  [self addSubview:view];
}






-(void)setRowHeight:(float)rowHeight{
  _rowHeight = rowHeight;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return _rowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return _maxValue - _minValue;
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  static NSString *SimpleTableIdentifier = @"cell";
  MNRulerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
  if(cell ==nil){
    cell = [[MNRulerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.label.frame = CGRectMake(_rowWidth*0.1,(_rowHeight-LABEL_SIZE)/2, LABEL_SIZE , LABEL_SIZE);
    
    
    cell.small_Line1.frame = CGRectMake(_rowWidth, 10, -(_rowWidth*0.25), 1);
    cell.small_Line2.frame = CGRectMake(_rowWidth, 20, -(_rowWidth*0.25), 1);
    cell.small_Line3.frame = CGRectMake(_rowWidth, 30, -(_rowWidth*0.25), 1);
    cell.small_Line4.frame = CGRectMake(_rowWidth, 40, -(_rowWidth*0.25), 1);
    cell.small_Line5.frame = CGRectMake(_rowWidth, 60, -(_rowWidth*0.25), 1);
    cell.small_Line6.frame = CGRectMake(_rowWidth, 70, -(_rowWidth*0.25), 1);
    cell.small_Line7.frame = CGRectMake(_rowWidth, 80, -(_rowWidth*0.25), 1);
    cell.small_Line8.frame = CGRectMake(_rowWidth, 90, -(_rowWidth*0.25), 1);
    
    cell.large_Line.frame  = CGRectMake(_rowWidth, 49, -(_rowWidth*0.5), 3);
    cell.mid_Line.frame    = CGRectMake(_rowWidth, 0, -(_rowWidth*0.35), 1);
    
  }
  
  
  cell.label.text = [NSString stringWithFormat:@"%ld",indexPath.row+_minValue];
  
  
  return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
  
  NSInteger currentRow =(int)(_tableView.contentOffset.y+(self.frame.size.width-_rowWidth)/2)/10;
  
  NSLog(@"%f",_tableView.contentOffset.y);
  
  
  if([_delegate respondsToSelector:@selector(RulerViewDidScroll:currentValue:)]){
    [self.delegate RulerViewDidScroll:self currentValue:currentRow+_minValue*10];
  }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  CGFloat rowHeight = 10;
  
  // Auto scroll to next multiple of rowHeight
  CGFloat floatVal = targetContentOffset->y / rowHeight;
  NSInteger rounded = (NSInteger)(roundf(floatVal));
  
  targetContentOffset->y = rounded * rowHeight;
}
@end
