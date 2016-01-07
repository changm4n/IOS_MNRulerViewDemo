//
//  ViewController.m
//  MNRulerViewDeme
//
//  Created by 이창민 on 2015. 12. 30..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import "ViewController.h"
#import "MNRulerView.h"
@interface ViewController () <MNRulerViewDelegate>
@property (strong, nonatomic) IBOutlet MNRulerView *ruler;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController 

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  _ruler.delegate = self;
  
  UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 3, 30)];
  view.backgroundColor = [UIColor redColor];
  view.alpha = 0.5;
  [_ruler setIndicatorView:view];
  

  
  
  
  // Do any additional setup after loading the view, typically from a nib.
}
-(void)RulerViewDidScroll:(MNRulerView *)MNRulerPickerView currentValue:(float)value{
  
  
  _label.text = [NSString stringWithFormat:@"%0.1f cm",value/10];
  
  
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
