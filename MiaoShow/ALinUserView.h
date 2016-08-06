//
//  ALinUserView.h
//  MiaowShow
//
//  Created by ALin on 16/6/28.
//  Copyright © 2016年 ALin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWUser;
@interface ALinUserView : UIView
+ (instancetype)userView;
/** 点击关闭 */
@property (nonatomic, copy) void (^closeBlock)();
/** 用户信息 */
@property (nonatomic, strong) JWUser *user;
@end
