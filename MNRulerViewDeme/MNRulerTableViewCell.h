//
//  MNRulerTableViewCell.h
//  MNRulerViewDeme
//
//  Created by 이창민 on 2015. 12. 31..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNRulerTableViewCell : UITableViewCell




@property (nonatomic, strong) UILabel *label;


@property (nonatomic, strong) UIView *small_Line1;
@property (nonatomic, strong) UIView *small_Line2;
@property (nonatomic, strong) UIView *small_Line3;
@property (nonatomic, strong) UIView *small_Line4;
@property (nonatomic, strong) UIView *small_Line5;
@property (nonatomic, strong) UIView *small_Line6;
@property (nonatomic, strong) UIView *small_Line7;
@property (nonatomic, strong) UIView *small_Line8;

@property (nonatomic, strong) UIView *mid_Line;
@property (nonatomic, strong) UIView *large_Line;

@property (nonatomic) float height;
@end
