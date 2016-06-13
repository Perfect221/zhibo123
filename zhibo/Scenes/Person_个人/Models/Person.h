//
//  Person.h
//  zhibo_pro
//
//  Created by lanou3g on 16/6/12.
//  Copyright © 2016年 xiaojun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


@property(nonatomic,copy)NSString *userName;//用户名
@property(nonatomic,copy)NSString *password;//密码
@property(nonatomic,copy)NSData  *avatar;//头像
@property(nonatomic,assign)BOOL loginState;//登录状态





@end
