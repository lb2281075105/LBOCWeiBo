//
//  LBAccountTool.m
//  LBOCWeiBo
//
//  Created by 常金城 on 2018/6/1.
//  Copyright © 2018年 liubo. All rights reserved.
//

#import "LBAccountTool.h"

// 账号的存储路径
#define LBAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation LBAccountTool


/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(LBAccount *)account
{
    // 自定义对象的存储必须用NSKeyedArchiver
    [NSKeyedArchiver archiveRootObject:account toFile:LBAccountPath];
}


/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (LBAccount *)account
{
    
    // 加载模型
    LBAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:LBAccountPath];
    
    /* 验证账号是否过期 */
    
    // 过期的秒数
    long long expires_in = [account.expires_in longLongValue];
    // 获得过期时间
    NSDate *expiresTime = [account.created_time dateByAddingTimeInterval:expires_in];
    // 获得当前时间
    NSDate *now = [NSDate date];
    
    // 如果expiresTime <= now，过期
    /**
     NSOrderedAscending = -1L, 升序，右边 > 左边
     NSOrderedSame, 一样
     NSOrderedDescending 降序，右边 < 左边
     */
    NSComparisonResult result = [expiresTime compare:now];
    if (result != NSOrderedDescending) { // 过期
        return nil;
    }
    
    return account;
}
@end
