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
  
  UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 3, 30)];
  view.backgroundColor = [UIColor redColor];
  view.alpha = 0.5;
  
  

  MNRulerView *vc2 = [[MNRulerView alloc]initWithFrame:CGRectMake(0, 60, 320, 100)];
  vc2.delegate = self;
//  [vc2 setMaxValue:30 MinValue:10];
//  [vc2 setBackgroundColorOfCell:[UIColor blueColor]];
  [vc2 setBackgroundColorOfLine:[UIColor whiteColor]];
  [vc2 setIndicatorView:view];
  
  
  
  [self.view addSubview:vc2];
  
  
  
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
