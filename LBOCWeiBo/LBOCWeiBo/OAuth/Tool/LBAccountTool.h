//
//  LBAccountTool.h
//  LBOCWeiBo
//
//  Created by 常金城 on 2018/6/1.
//  Copyright © 2018年 liubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBAccount.h"
@interface LBAccountTool : NSObject
/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(LBAccount *)account;

/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (LBAccount *)account;
@end
