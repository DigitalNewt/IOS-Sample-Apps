//
//  webViewViewController.m
//  webView
//
//  Created by Baker Brent on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "webViewViewController.h"

@implementation webViewViewController
@synthesize webView;

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    
    
    [super viewDidLoad];
}

@end
