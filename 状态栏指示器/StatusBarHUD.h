//
//  statusBarHUD.h
//  状态栏指示器
//
//  Created by chenlishuang on 17/4/2.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusBarHUD : NSObject

/**
 加载成功
 */
+ (void)showSuccess:(NSString *)msg;
/**
 加载失败
 */
+ (void)showError:(NSString *)msg;
/**
 正在加载
 */
+ (void)showLoading:(NSString *)msg;

/**
 隐藏
 */
+ (void)hide;

/**
 显示普通信息
 */
+ (void)showMeaasge:(NSString *)msg image:(UIImage *)image;
@end
