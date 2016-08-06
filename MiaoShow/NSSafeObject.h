//
//  NSSafeObject.h
//  MiaoShow
//
//  Created by jinwei on 16/8/5.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSafeObject : NSObject
- (instancetype)initWithObject:(id)object;
- (instancetype)initWithObject:(id)object withSelector:(SEL)selector;
- (void)excute;

@end
