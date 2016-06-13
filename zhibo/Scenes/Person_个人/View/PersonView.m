//
//  PersonView.m
//  zhibo_pro
//
//  Created by lanou3g on 16/6/12.
//  Copyright © 2016年 xiaojun. All rights reserved.
//

#import "PersonView.h"
#import <Masonry.h>

@implementation PersonView


//重写init方法
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建视图并且添加
        _personImageView = [[UIImageView alloc]init];
        _personImageView.image = [UIImage imageNamed:@"111.png"];
      
        
        
        //创建登录
        _personUserLogin = [UIButton buttonWithType:UIButtonTypeSystem];
        [_personUserLogin setTitle:@"登录" forState:UIControlStateNormal];
        _personUserLogin.frame = CGRectMake(130, 80, 40, 40);
        _personUserLogin.backgroundColor = [UIColor whiteColor];
        
        [_personUserLogin addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //创建注册
        _personRegistered = [UIButton buttonWithType:UIButtonTypeSystem];
        [_personRegistered setTitle:@"注册" forState:UIControlStateNormal];
        _personRegistered.frame = CGRectMake(240, 80, 40, 40);
        _personRegistered.backgroundColor =[UIColor whiteColor];
        [_personRegistered addTarget:self action:@selector(registeredAction) forControlEvents:UIControlEventTouchUpInside];
        
     
        [self addSubview:_personImageView];
        [self addSubview:_personUserLogin];
        [self addSubview:_personRegistered];
        
        //给头像添加约束
        //给头像添加约束
        [_personImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            //与父视图中心点 x 坐标一样
            make.centerX.mas_equalTo(self.mas_centerX);
            //在父视图中心点 y 坐标向上偏移 15 个单位
            make.centerY.mas_equalTo(self.mas_centerY).with.offset(-15);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
        
    }
           return self;
}


-(void)loginAction{
    NSLog(@"我的天啦");
}

-(void)registeredAction{
    NSLog(@"我的神啦");
}







@end
