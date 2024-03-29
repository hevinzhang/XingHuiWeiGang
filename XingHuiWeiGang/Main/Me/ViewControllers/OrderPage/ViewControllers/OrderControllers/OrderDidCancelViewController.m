//
//  OrderDidCancelViewController.m
//  XingHuiWeiGang
//
//  Created by 张锋 on 15/7/28.
//  Copyright (c) 2015年 zxl－mac1. All rights reserved.
//

#import "OrderDidCancelViewController.h"
#import "OrderDidfinishedCell.h"
#import "OrderTool.h"
@interface OrderDidCancelViewController ()

@end

@implementation OrderDidCancelViewController

- (void)viewDidLoad {
    self.cellClass=[OrderDidfinishedCell class];
    self.orderStatus = OrderStatusDidCancel;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadData {
    showMyOrderParam *param = [[showMyOrderParam alloc]init];
    param.userId = @27;
    param.status = [NSNumber numberWithInteger:OrderStatusDidCancel];
    __weak typeof(self) Weakself=self;
    [OrderTool showMyOrderWithParam:param success:^(id json) {
        if ([json[@"code"] integerValue]) {
            return ;
        }
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in json[@"list"]) {
            showWillPayOrder *orderResult = [showWillPayOrder objectWithKeyValues:dict];
            [temp addObject:orderResult];
        }
        Weakself.dataArray = temp;
    } failure:^(NSError *error) {
        
    }];
}
@end
