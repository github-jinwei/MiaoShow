//
//  JWLiveCollectionViewController.h
//  MiaoShow
//
//  Created by jinwei on 16/8/5.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWLive;
@interface JWLiveCollectionViewController : UICollectionViewController
/** 直播 */
@property (nonatomic, strong) NSArray *lives;
/** 当前的index */
@property (nonatomic, assign) NSUInteger currentIndex;
@end
