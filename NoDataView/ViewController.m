//
//  ViewController.m
//  NoDataView
//
//  Created by Admin on 16/7/25.
//  Copyright © 2016年 王海军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)itemClick:(UIButton *)sender {
    [self.noDataView showInView:self.view withMainTitle:@"未找到附近停车场！" subtitle:nil imageName:@"chaxun" whetherDisplayButton:YES buttonTitle:@"刷  新"];
    __weak typeof(self) weakSelf = self;
    self.noDataView.block = ^{
        [weakSelf.noDataView removeNoDataAndNetworkView];
    };
}

- (IBAction)noNet:(id)sender {
    [self.noDataView showInView:self.view withMainTitle:@"加载失败！" subtitle:@"请检查您的网络是否正常" imageName:@"jiazaishibai" whetherDisplayButton:YES buttonTitle:@"刷  新"];
    
    __weak typeof(self) weakSelf = self;
    self.noDataView.block = ^{
        [weakSelf.noDataView removeNoDataAndNetworkView];
    };
}

- (void)click:(UIButton *)sender
{
    
}

- (ZHNoDataView *)noDataView
{
    if (!_noDataView) {
        _noDataView = [[ZHNoDataView alloc] init];
    }
    return _noDataView;
}

@end
