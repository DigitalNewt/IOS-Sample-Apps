//
//  MainViewController.m
//  mk
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 Global Institution. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize myTextView;

- (void)viewDidLoad
{
    myTextView.text = @"What the does this say: --> Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    
    myTextView.editable = NO;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
//    if (theTextField == self.myTextView) {
//        [theTextField resignFirstResponder];
//    }
//    return YES;
//}
@end
