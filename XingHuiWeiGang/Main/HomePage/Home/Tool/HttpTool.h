//
//  HttpTool.h
//  XingHuiWeiGang
//
//  Created by 张锋 on 15/7/20.
//  Copyright (c) 2015年 zxl－mac1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject
+(void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure;
+(void)postWithURL:(NSString *)url json:(NSDictionary *)json success:(void (^)(id))success failure:(void (^)(NSError *))failure;
@end
