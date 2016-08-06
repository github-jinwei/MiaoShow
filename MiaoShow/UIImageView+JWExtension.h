//
//  UIImageView+JWExtension.h
//  MiaoShow
//
//  Created by jinwei on 16/7/25.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (JWExtension)
// 播放GIF
- (void)playGifAnim:(NSArray *)images;
// 停止动画
- (void)stopGifAnim;
@end
