//
//  AViewController.m
//  NoDataView
//
//  Created by Admin on 16/7/25.
//  Copyright © 2016年 王海军. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController
- (IBAction)noNet:(id)sender {
    
    [self.noDataView showInView:self.view withMainTitle:@"加载失败！" subtitle:@"请检查您的网络是否正常" imageName:@"jiazaishibai" whetherDisplayButton:YES buttonTitle:@"刷  新"];
    
    __weak typeof(self) weakSelf = self;
    self.noDataView.block = ^{
        [weakSelf.noDataView removeNoDataAndNetworkView];
    };
}
- (IBAction)noData:(id)sender {
    
    [self.noDataView showInView:self.view withMainTitle:@"未找到附近停车场！" subtitle:nil imageName:@"chaxun" whetherDisplayButton:YES buttonTitle:@"刷  新"];
    __weak typeof(self) weakSelf = self;
    self.noDataView.block = ^{
        [weakSelf.noDataView removeNoDataAndNetworkView];
    };
}

- (void)click:(UIButton *)sender
{
    [self.noDataView removeNoDataAndNetworkView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
