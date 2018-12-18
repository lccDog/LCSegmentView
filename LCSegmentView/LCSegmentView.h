//
//  LCSegmentView.h
//  CaiNiaoYouDan
//
//  Created by lcc on 2018/12/18.
//  Copyright © 2018年 财鸟金服. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCSegmentView : UIView
@property (strong, nonatomic) void(^selectSegment)(NSInteger tag);

// 标题
@property (nonatomic,strong) NSArray *titleArray;

// 标题字号
@property (nonatomic,strong) UIFont *font;

// 标题颜色
@property (nonatomic,strong) UIColor *titleColor;

// line颜色
@property (nonatomic,strong) UIColor *lineColor;


@end

NS_ASSUME_NONNULL_END
