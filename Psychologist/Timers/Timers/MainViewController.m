//
//  MainViewController.m
//  Timers
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 Global Institution. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize myLabel;

- (void)viewDidLoad
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addOne) userInfo:nil repeats:YES];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void) addOne{
    static int i=0;
    
    NSLog(@"%d",i);
    myLabel.text = [NSString stringWithFormat:@"%d",i];
    
    if (i > 9) {
        [timer invalidate];
    }
    
    i++;
}
@end
