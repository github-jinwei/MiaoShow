//
//  ALinLiveViewCell.h
//  MiaowShow
//
//  Created by ALin on 16/6/23.
//  Copyright © 2016年 ALin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWLive, JWUser;
@interface ALinLiveViewCell : UICollectionViewCell
/** 直播 */
@property (nonatomic, strong) JWLive *live;
/** 相关的直播或者主播 */
@property (nonatomic, strong) JWLive *relateLive;
/** 父控制器 */
@property (nonatomic, weak) UIViewController *parentVc;
/** 点击关联主播 */
@property (nonatomic, copy) void (^clickRelatedLive)();
@end
