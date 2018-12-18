//
//  LCSegmentView.m
//  CaiNiaoYouDan
//
//  Created by lcc on 2018/12/18.
//  Copyright © 2018年 财鸟金服. All rights reserved.
//

#import "LCSegmentView.h"

@interface LCSegmentView ()
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) NSArray *titleArr;

@end


@implementation LCSegmentView

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColorWhite;
    }
    return self;
}


- (void)setTitleArray:(NSArray *)titleArray {
    self.titleArr = titleArray;
    [self creatUI];
}
-(void)creatUI
{
    /** 选择按钮 */
    for (int i = 0; i < self.titleArr.count; i++) {
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [selectBtn setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [selectBtn setTitleColor:self.titleColor forState:UIControlStateNormal];
        [selectBtn setTitleColor:self.titleColor forState:UIControlStateSelected|UIControlStateHighlighted];
        [selectBtn setTitleColor:self.titleColor forState:UIControlStateSelected];
        selectBtn.titleLabel.font = self.font;
        selectBtn.tag = i+10;
        [selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:selectBtn];
        if (selectBtn.tag == 10) {
            selectBtn.selected = YES;
        }
        
        
        selectBtn.sd_layout.leftSpaceToView(self, i * self.width / self.titleArr.count).topSpaceToView(self, 0).widthIs(self.width / self.titleArr.count).heightIs(49);
    }
    /** 下划线 */
    UIButton * btn = (UIButton *)[self viewWithTag:10];
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, btn.maxY - 3, 40, 3)];
    _lineView.centerX = btn.centerX;
    [self addSubview:_lineView];
    _lineView.backgroundColor = self.lineColor;
    _lineView.layer.cornerRadius = 1;
}

-(void)selectBtnClick:(UIButton *)sender
{
    WeakSelf
    for (int i = 0; i<self.titleArr.count; i++) {
        UIButton *selectBtn = (UIButton *)[self viewWithTag:i+10];
        selectBtn.selected = NO;
    }
    sender.selected = YES;
    
    [UIView animateWithDuration:0.1 animations:^(void){
        weakSelf.lineView.centerX = sender.centerX;
        
    } completion:^(BOOL finished) {
        
    }];
    if (self.selectSegment) {
        self.selectSegment(sender.tag-10);
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
