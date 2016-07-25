//
//  ViewController.h
//  NoDataView
//
//  Created by Admin on 16/7/25.
//  Copyright © 2016年 王海军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHNoDataView.h"

@interface ViewController : UIViewController

// 方便子类调用
@property (nonatomic, strong) ZHNoDataView *noDataView;

@end

