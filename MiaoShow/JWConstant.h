//
//  JWConstant.h
//  MiaoShow
//
//  Created by jinwei on 16/7/25.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Frame相关
// 屏幕宽/高
#define JWScreenWidth  [UIScreen mainScreen].bounds.size.width
#define JWScreenHeight [UIScreen mainScreen].bounds.size.height

// 首页的选择器的宽度
#define Home_Seleted_Item_W 60
#define DefaultMargin       10

#pragma mark - 颜色
// 颜色相关
#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define KeyColor Color(216, 41, 116)

#pragma mark - 通知
// 当前没有关注的主播, 去看热门主播
#define kNotifyToseeBigWorld @"kNotifyToseeBigWorld"
// 当前的直播控制器即将消失
#define kNotifyLiveWillDisappear @"kNotifyLiveWillDisappear"
// 点击了用户
#define kNotifyClickUser @"kNotifyClickUser"
// 自动刷新最新主播界面
#define kNotifyRefreshNew @"kNotifyRefreshNew"

#pragma mark - 其他
// 上一次刷新的时间
#define kLastRefreshDate @"kLastRefreshDate"

