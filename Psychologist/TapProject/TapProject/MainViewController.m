//
//  MainViewController.m
//  TapProject
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize myLabel;

- (IBAction)handelMyTap:(UITapGestureRecognizer *)recognized {
    
    //Implement your code here.
    myLabel.text = @" OUCH!! ";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [self setMyLabel:nil];
    [super viewDidUnload];
}
@end
