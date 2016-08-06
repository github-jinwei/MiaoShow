//
//  ALinAnchorViewCell.h
//  MiaowShow
//
//  Created by ALin on 16/6/14.
//  Copyright © 2016年 ALin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWUser;

@interface ALinAnchorViewCell : UICollectionViewCell
/** 主播 */
@property(nonatomic, strong) JWUser *user;
@end
