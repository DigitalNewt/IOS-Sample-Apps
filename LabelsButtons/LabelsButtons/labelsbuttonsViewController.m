//
//  labelsbuttonsViewController.m
//  LabelsButtons
//
//  Created by Baker Brent on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "labelsbuttonsViewController.h"

@implementation labelsbuttonsViewController
@synthesize myLabel;
@synthesize myTextView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (IBAction)ButtonPressed:(id)sender {
    
    [myTextView resignFirstResponder];
    
    if ([myTextView.text isEqualToString:@""]) {
        myLabel.text = @" This is a sentence ";
    } else {
        myLabel.text = myTextView.text;
    }
        

}

- (IBAction)hideLabel:(id)sender {
    if (myLabel.hidden == NO) {
        myLabel.hidden = YES;   
    } else {
        myLabel.hidden = NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyLabel:nil];
    [self setMyTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
