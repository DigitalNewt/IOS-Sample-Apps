//
//  HWViewController.m
//  HelloWorld
//
//  Created by Newt on 1/24/13.
//  Copyright (c) 2013 Brainwashinc.com. All rights reserved.
//

#import "HWViewController.h"

@implementation HWViewController

@synthesize lblHelloWorld;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doBtnHide:(id)sender {
    [lblHelloWorld setHidden:![lblHelloWorld isHidden]];
     [sender setTitle:[lblHelloWorld isHidden]? @"Show" : @"Hide" forState:UIControlStateNormal];
}
@end
