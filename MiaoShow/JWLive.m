//
//  JWLive.m
//  MiaoShow
//
//  Created by jinwei on 16/8/6.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import "JWLive.h"

@implementation JWLive
- (UIImage *)starImage
{
    if (self.starlevel) {
        return [UIImage imageNamed:[NSString stringWithFormat:@"girl_star%ld_40x19", self.starlevel]];
    }
    return nil;
}
@end
