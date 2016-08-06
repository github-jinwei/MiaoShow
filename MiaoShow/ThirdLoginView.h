//
//  ThirdLoginView.h
//  MiaoShow
//
//  Created by jinwei on 16/7/24.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LoginType) {
    LoginTypeSina,
    LoginTypeQQ,
    LoginTypeWechat
};
@interface ThirdLoginView : UIView
/** 点击按钮 */
@property (nonatomic, copy) void (^clickLogin)(LoginType type);
@end
