//
//  MainViewController.m
//  LONGPress
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 Global Instituion. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize myLabel;

- (IBAction)longPressed:(UILongPressGestureRecognizer *)recognizer{
    myLabel.text = @"LOOONG PRESS";
}

- (void)viewDidUnload {
    [self setMyLabel:nil];
    [self setMyLabel:nil];
    [super viewDidUnload];
}
@end
