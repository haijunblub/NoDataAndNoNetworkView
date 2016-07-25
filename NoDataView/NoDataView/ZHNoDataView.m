//
//  ZHNoDataView.m
//  NoDataView
//
//  Created by Admin on 16/7/25.
//  Copyright © 2016年 王海军. All rights reserved.
//

#import "ZHNoDataView.h"

#define UISCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define UISCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@interface ZHNoDataView ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIButton *refreshButton;

@end

@implementation ZHNoDataView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
        
        [self createUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.frame = (CGRect){0, 64, UISCREEN_WIDTH, UISCREEN_HEIGHT - 64};
    
    self.imageV.center = CGPointMake(UISCREEN_WIDTH * 0.5, 95 + 50);
    self.imageV.bounds = CGRectMake(0, 0, 100, 100);
    
    CGRect rect = self.imageV.frame;
    CGFloat label_Y = CGRectGetMaxY(rect);
    self.titleLabel.frame = (CGRect){0, label_Y + 10, UISCREEN_WIDTH, 30};
    
    CGRect rect1 = self.titleLabel.frame;
    CGFloat chekNetLabel_Y = CGRectGetMaxY(rect1);
    self.subTitleLabel.frame = (CGRect){0, chekNetLabel_Y, UISCREEN_WIDTH, 30};
    
    CGRect rect2 = self.subTitleLabel.frame;
    CGFloat refreshButton_Y = CGRectGetMaxY(rect2);
    self.refreshButton.center = CGPointMake(UISCREEN_WIDTH * 0.5, refreshButton_Y + 30);
    self.refreshButton.bounds = CGRectMake(0, 0, 65, 30);
}

- (void)createUI
{
    self.imageV = [[UIImageView alloc] init];
    [self addSubview:self.imageV];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    self.subTitleLabel = [[UILabel alloc] init];
    self.subTitleLabel.font = [UIFont systemFontOfSize:12];
    self.subTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.subTitleLabel];
    
    self.refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.refreshButton.titleLabel.font = [UIFont systemFontOfSize:15];
    // 按钮普通状态颜色
    [self.refreshButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 按钮高亮颜色
    UIColor *highlightedColor = [UIColor whiteColor];
    [self.refreshButton setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    
    [self.refreshButton addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];
    
    self.refreshButton.layer.cornerRadius = 5;
    self.refreshButton.layer.masksToBounds = YES;
    self.refreshButton.layer.borderWidth = 1;
    self.refreshButton.layer.borderColor = [UIColor blackColor].CGColor;

}

- (void)showInView:(UIView *)view withMainTitle:(NSString *)mainTitle subtitle:(NSString *)subtitle imageName:(NSString *)imageName whetherDisplayButton:(BOOL)whetherDisplayButton buttonTitle:(NSString *)buttonTitle
{

    self.imageV.image = [UIImage imageNamed:imageName];
    self.titleLabel.text = mainTitle;
    self.subTitleLabel.text = subtitle;
    
    if (whetherDisplayButton == YES) {
        
        [self.refreshButton setTitle:buttonTitle forState:UIControlStateNormal];
        [self addSubview:self.refreshButton];
    }
    
    [view addSubview:self];
}

- (void)removeNoDataAndNetworkView
{
    if (self != nil) {
        [self removeFromSuperview];
    }
}

- (void)refresh:(UIButton *)sender
{
    if (self.block) {
        self.block();
    }
}

@end
