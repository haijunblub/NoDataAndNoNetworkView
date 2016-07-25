//
//  ZHNoDataView.h
//  NoDataView
//
//  Created by Admin on 16/7/25.
//  Copyright © 2016年 王海军. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZHVoidBlock)();

@interface ZHNoDataView : UIView

@property (nonatomic, strong) UIView *noDataAndNetworkView; // 无数据无网络界面展示的View
@property (nonatomic, copy) ZHVoidBlock block;


/**
 *  用来显示网络加载时无数据和无网络两种情况下的界面显示视图
 *  注意：可放在基类中创建，移除视图使用属性noDataAndNetworkView来调用
 *  使用属性refreshButton来给按钮添加方法, 每次执行刷新时先清空上一次的数据
 *  @param view                 当前控制器的View
 *  @param mainTitle            主标题
 *  @param subtitle             副标题
 *  @param imageName            显示图片
 *  @param whetherDisplayButton BOOL值，是否显示底部的刷新按钮
 *  @param buttonTitle          刷新按钮按钮的标题
 */
- (void)showInView:(UIView *)view withMainTitle:(NSString *)mainTitle subtitle:(NSString *)subtitle imageName:(NSString *)imageName whetherDisplayButton:(BOOL)whetherDisplayButton buttonTitle:(NSString *)buttonTitle;

/**
 *  移除无数据和无网络视图
 */
- (void)removeNoDataAndNetworkView;

@end
