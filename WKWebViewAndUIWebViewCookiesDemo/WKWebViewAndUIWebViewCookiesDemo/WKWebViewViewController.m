//
//  WKWebViewViewController.m
//  WKWebViewAndUIWebViewCookiesDemo
//
//  Created by 奉强 on 16/5/4.
//  Copyright © 2016年 fengqiang. All rights reserved.
//

#import "WKWebViewViewController.h"
#import <WebKit/WebKit.h>
#import "WKCookieSyncManager.h"

@interface WKWebViewViewController ()

@property (nonatomic, strong) WKWebView *mainWebView;

@end

@implementation WKWebViewViewController

#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setMainWebView];
}


#pragma mark -  BuildView
- (void)setMainWebView {
    WKCookieSyncManager *cookiesManager = [WKCookieSyncManager sharedWKCookieSyncManager];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.processPool = cookiesManager.processPool;
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) configuration:configuration];
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:@"http://duoshuo.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    
    self.mainWebView = webView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
