//
//  ALinLiveAnchorView.h
//  MiaowShow
//
//  Created by ALin on 16/6/16.
//  Copyright © 2016年 ALin. All rights reserved.
//  直播间主播相关的视图

#import <UIKit/UIKit.h>

@class JWLive;
@class JWUser;

@interface ALinLiveAnchorView : UIView
+ (instancetype)liveAnchorView;
/** 主播 */
@property(nonatomic, strong) JWUser *user;
/** 直播 */
@property(nonatomic, strong) JWLive *live;
/** 点击开关  */
@property(nonatomic, copy)void (^clickDeviceShow)(bool selected);
@end
