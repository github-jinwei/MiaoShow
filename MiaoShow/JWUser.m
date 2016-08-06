//
//  JWUser.m
//  MiaoShow
//
//  Created by jinwei on 16/8/6.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import "JWUser.h"
#import <MJExtension/MJExtension.h>

@implementation JWUser
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"newStar":@"new"};
}
@end
