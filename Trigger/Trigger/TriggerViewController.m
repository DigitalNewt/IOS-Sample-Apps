//
//  TriggerViewController.m
//  Trigger
//
//  Created by Baker Brent on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TriggerViewController.h"

@implementation TriggerViewController
@synthesize webView;


- (void)viewDidLoad
{
    //NSURL *url = [NSURL URLWithString:@"http://172.40.4.162/trigger"];
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url]; 
    [webView loadRequest:req];

    [super viewDidLoad];
}


@end
