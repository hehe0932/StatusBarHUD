//
//  ViewController.m
//  状态栏指示器
//
//  Created by chenlishuang on 17/4/2.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "ViewController.h"
#import "StatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)success:(id)sender {
    [StatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error:(id)sender {
    [StatusBarHUD showError:@"加载失败"];
}
- (IBAction)loading:(id)sender {
    [StatusBarHUD showLoading:@"正在加载..."];
}
- (IBAction)hide:(id)sender {
    [StatusBarHUD hide];
}
- (IBAction)message:(id)sender {
    
//    [StatusBarHUD showMeaasge:@"没有什么事"];
}

@end
