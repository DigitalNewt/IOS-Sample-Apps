//
//  sliderGameViewController.m
//  sliderGame
//
//  Created by Baker Brent on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "sliderGameViewController.h"

@implementation sliderGameViewController
@synthesize myNewValue;
@synthesize mySlider;
@synthesize myProgressBar;
@synthesize myResult;
@synthesize mySwitch;
@synthesize mySliderValue;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMyNewValue:nil];
    [self setMySlider:nil];
    [self setMyProgressBar:nil];
    [self setMyResult:nil];
    [self setMySwitch:nil];
    [self setMySliderValue:nil];
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
- (IBAction)newValue:(id)sender {
    int r = arc4random() % 101;
    
    myNewValue.text = [NSString stringWithFormat:@"%d",r];
}

- (IBAction)valueChanged:(id)sender {
    mySliderValue.text = [NSString stringWithFormat:@"%.0f",mySlider.value];
}

- (IBAction)check:(id)sender {
    
    int m,n;
    
    m = [myNewValue.text intValue];
    n = mySlider.value;
    
    if(m>=n-3 && m<=n+3) {
        myResult.text = @"CORRECT!!";
    } else {
        myResult.text = @"WROONNNGGG!!";
    }
}
- (IBAction)hintChanged:(id)sender {
    
    if(mySwitch.on == YES) {
        mySliderValue.hidden = NO;
    } else {
        mySliderValue.hidden = YES;
    }
}


@end
