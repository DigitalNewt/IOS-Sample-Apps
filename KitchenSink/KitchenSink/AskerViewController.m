//
//  AskerViewController.m
//  KitchenSink
//
//  Created by Newt on 3/26/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "AskerViewController.h"

@interface AskerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextField *answerTextField;
@end

@implementation AskerViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.questionLabel.text = self.question;
    self.answerTextField.text = nil;
    [self.answerTextField becomeFirstResponder];
}

- (NSString *)answer
{
    return self.answerTextField.text;
}

@end
