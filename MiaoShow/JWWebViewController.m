//
//  JWWebViewController.m
//  MiaoShow
//
//  Created by jinwei on 16/8/6.
//  Copyright © 2016年 jinwei. All rights reserved.
//

#import "JWWebViewController.h"

@interface JWWebViewController ()
/** webView */
@property (nonatomic, weak) UIWebView *webView;

@end

@implementation JWWebViewController

- (UIWebView *)webView
{
    if (!_webView) {
        UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:web];
        _webView = web;
    }
    return _webView;
}

- (instancetype)initWithUrlStr:(NSString *)url
{
    if (self = [self init]) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
