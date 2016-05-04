//
//  ViewController.m
//  WKWebViewAndUIWebViewCookiesDemo
//
//  Created by 奉强 on 16/5/4.
//  Copyright © 2016年 fengqiang. All rights reserved.
//

#import "UIWebViewViewController.h"
#import "WKCookieSyncManager.h"

@interface UIWebViewViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *mainWebView;

@end

@implementation UIWebViewViewController

#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setMainWebView];
    
}

#pragma mark - BuildView
- (void)setMainWebView {
    NSURL *url = [NSURL URLWithString:@"http://duoshuo.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.mainWebView loadRequest:request];
    
    self.mainWebView.delegate = self;
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //创建设置cookie单例
    WKCookieSyncManager *cookiesManager = [WKCookieSyncManager sharedWKCookieSyncManager];
    //搬移cookies
    [cookiesManager setCookie];
}

@end
