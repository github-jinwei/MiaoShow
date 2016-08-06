//
//  NSObject+JWHUD.m
//  MiaoShow
//
//  Created by jinwei on 16/7/25.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import "NSObject+JWHUD.h"

@implementation NSObject (JWHUD)
- (void)showInfo:(NSString *)info
{
    if ([self isKindOfClass:[UIViewController class]] || [self isKindOfClass:[UIView class]]) {
        [[[UIAlertView alloc] initWithTitle:@"喵播" message:info delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
    }
}
@end
