//
//  MNRulerView.h
//  MNRulerViewDeme
//
//  Created by 이창민 on 2015. 12. 30..
//  Copyright (c) 2015년 changmin. All rights reserved.
//

#import <UIKit/UIKit.h>



@class MNRulerView;


@protocol MNRulerViewDelegate <NSObject>
@optional
- (NSInteger)MNRulerPickerView:(MNRulerView*)MNRulerPickerView titleForRow:(NSInteger)row;
-(void)MNRulerPickerView:(MNRulerView*)MNRulerPickerView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)rowHeightForMNRulerPickerView:(MNRulerView*)MNRulerPickerView;

@end

@interface MNRulerView : UIView



-(void)setIndicatorView:(UIView *)view;


@property (nonatomic, weak) id <MNRulerViewDelegate> delegate;


@end


