//
//  UIView+JWExtension.h
//  MiaoShow
//
//  Created by jinwei on 16/7/24.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JWExtension)
/** X */
@property (nonatomic, assign) CGFloat x;

/** Y */
@property (nonatomic, assign) CGFloat y;

/** Width */
@property (nonatomic, assign) CGFloat width;

/** Height */
@property (nonatomic, assign) CGFloat height;

/** size */
@property (nonatomic, assign) CGSize size;

/** centerX */
@property (nonatomic, assign) CGFloat centerX;

/** centerY */
@property (nonatomic, assign) CGFloat centerY;

/** tag */
@property (nonatomic, copy) NSString *tagStr;

- (BOOL)isShowingOnKeyWindow;
@end
