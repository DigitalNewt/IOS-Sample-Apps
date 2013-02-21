//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Baker Brent on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@property (nonatomic) BOOL decimalWasPressed;
@end

@implementation CalculatorViewController

@synthesize stackDisplay = _stackDisplay;
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;
@synthesize decimalWasPressed = _decimalWasPressed;

- (CalculatorBrain *)brain {
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle; //[sender currentTitle];
   // NSLog(@"digit pressed= %@", digit);
    //UILabel *myDisplay = self.display; //[self display];
    //NSString *currentText = myDisplay.text; //[myDisplay text];
    //NSString *newText = [currentText stringByAppendingString:digit];
    //myDisplay.text = newText;  //[myDisplay setText:newText];

    if (self.userIsInTheMiddleOfEnteringANumber) {
        if (([@"." isEqualToString:digit] && !self.decimalWasPressed) || ![@"." isEqualToString:digit]) {
            self.display.text = [self.display.text stringByAppendingString:digit];
        }
        if([@"." isEqualToString:digit]) {
            self.decimalWasPressed = YES;
        }
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
        if([@"." isEqualToString:digit]) {
            self.decimalWasPressed = YES;
        }
    }
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:self.display.text];
    self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:@" "];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.decimalWasPressed = NO;
}

- (IBAction)clear:(UIButton *)sender {
    self.display.text = @"0";
    [self.brain clear];
    
    self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:sender.currentTitle];
    self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:@" "];
}

- (IBAction)operationPressed:(UIButton *)sender {
    
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    
    self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:sender.currentTitle];
    self.stackDisplay.text = [self.stackDisplay.text stringByAppendingString:@" "];
    
//    self.stackDisplay.text = [NSString stringWithFormat:@"%@ %@",self.brain.showStack, sender.currentTitle]; 
    
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

- (void)viewDidUnload {
    [self setStackDisplay:nil];
    [super viewDidUnload];
}
@end
