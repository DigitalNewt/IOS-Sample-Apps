//
//  MainViewController.m
//  noARC
//
//  Created by Baker Brent on 5/26/12.
//  Copyright (c) 2012 Global Institution. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad
{
    NSString *string = [[NSString alloc] initWithFormat:@"Hi"];
    
    NSLog(@"%@",string);
    
    [string release];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

@end
