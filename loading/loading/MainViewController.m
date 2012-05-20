//
//  MainViewController.m
//  loading
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 Global Institution. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize myLabel;
@synthesize myActivityIndicatorView;

-(void) myMethod {
    
    myLabel.text = @"Welcome";
    
    [myActivityIndicatorView stopAnimating];
    myActivityIndicatorView.hidden = YES;
}

- (void)viewDidLoad
{
    [myActivityIndicatorView startAnimating];
    [self performSelector:@selector(myMethod) withObject:nil afterDelay:4.0f];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

@end
