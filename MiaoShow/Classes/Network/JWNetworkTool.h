//
//  JWNetworkTool.h
//  MiaoShow
//
//  Created by jinwei on 16/7/24.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
typedef NS_ENUM(NSInteger,NetworkStates) {
    NetworkStatesNone,
    NetworkStates2G,
    NetworkStates3G,
    NetworkStates4G,
    NetworkStatesWIFI
};

@interface JWNetworkTool : AFHTTPSessionManager

+(instancetype)shareTool;

//判断网络类型
+ (NetworkStates)getNetworkStates;


@end
