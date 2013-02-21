//
//  MainViewController.m
//  ProgressView
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 Global Institution. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize myProgressView;
@synthesize myLabel;


- (void) moreProgress{
    static int i=10;
    
    myProgressView.progress += 0.1;
    
    myLabel.text = [NSString stringWithFormat:@"%d %%",i];
    
    if (myProgressView.progress == 1) {
        [timer invalidate];
    }
    
    i += 10;
}

- (void)viewDidLoad
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgress) userInfo:nil repeats:YES];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [self setMyProgressView:nil];
    [self setMyLabel:nil];
    [super viewDidUnload];
}
@end
