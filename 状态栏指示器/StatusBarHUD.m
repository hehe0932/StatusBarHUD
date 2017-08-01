//
//  statusBarHUD.m
//  状态栏指示器
//
//  Created by chenlishuang on 17/4/2.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "StatusBarHUD.h"
#define messageFont [UIFont systemFontOfSize:12]

@implementation StatusBarHUD
static UIWindow *window_;
static NSTimer *timer_;

/**
 初始化窗口
 */
+ (void)showWindow{
    //frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    //显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    window_.hidden = NO;
    window_.backgroundColor = [UIColor blackColor];
    //window_级别设成最高级别
    window_.windowLevel = UIWindowLevelAlert;
    frame.origin.y = 0;
    [UIView animateWithDuration:.2 animations:^{
        window_.frame = frame;
    }];
}
+ (void)showSuccess:(NSString *)msg{
    [self showMeaasge:msg image:[UIImage imageNamed:@"对勾"]];
}

+ (void)showError:(NSString *)msg{
    [self showMeaasge:msg image:[UIImage imageNamed:@"叉叉"]];
}

+ (void)showLoading:(NSString *)msg{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    [self showWindow];
    //添加文字
    UILabel *label = [[UILabel alloc]init];
    label.font = messageFont;
    label.textColor = [UIColor whiteColor];
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;

    [window_ addSubview:label];
    //添加圈圈
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : messageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW)*0.5-20;
    CGFloat centerY = window_.frame.size.height*0.5;
    loadView.center = CGPointMake(centerX, centerY);
    [loadView startAnimating];
    [window_ addSubview:loadView];
}

+ (void)showMeaasge:(NSString *)msg image:(UIImage *)image{
    //停止定时器
    [timer_ invalidate];
    
    [self showWindow];
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    button.titleLabel.font = messageFont;
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    //定时器

    timer_ = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
+ (void)hide{
    
    [UIView animateWithDuration:.2 animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        //停止定时器
        [timer_ invalidate];
        window_ = nil;
    }];
}


@end
