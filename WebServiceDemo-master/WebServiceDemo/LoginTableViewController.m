//
//  LoginTableViewController.m
//  WebServiceDemo
//
//  Created by Andrew Barba on 10/14/12.
//  Copyright (c) 2012 Andrew Barba. All rights reserved.
//

#import "LoginTableViewController.h"
#import "SkillsTableViewController.h"
#import "iOSRequest.h"

@interface LoginTableViewController ()
// Data Model
@property (nonatomic, strong) NSDictionary *user;

// Login UI
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginButton;

// User UI
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hashLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfSkillsLabel;
@end

@implementation LoginTableViewController

-(void)loginWithUserName:(NSString *)userName andPassword:(NSString *)password
{
    NSLog(@"%@ : %@",userName,password);
    [iOSRequest loginWithUsername:userName andPassword:password onCompletion:^(NSDictionary *user){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setUser:user];
            [self endLogin];
        });
    }];
}

- (IBAction)login:(id)sender
{
    [self beginLogin];
    [self loginWithUserName:self.userNameField.text andPassword:self.passwordField.text];
}

-(void)setUser:(NSDictionary *)user
{
    if (_user != user) {
        _user = user;
    }
    [self updateUIWithUser:user];
}

-(void)updateUIWithUser:(NSDictionary *)user
{
    if (user) {
        self.firstNameLabel.text = user[@"first_name"];
        self.lastNameLabel.text = user[@"last_name"];
        self.hashLabel.text = user[@"hash"];
        self.numberOfSkillsLabel.text = [NSString stringWithFormat:@"%i",[user[@"skills"] count]];
    } else {
        [self resetUI];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Skills Segue"]) {
        SkillsTableViewController *skillsTVC = segue.destinationViewController;
        [skillsTVC setSkills:self.user[@"skills"]];
    }
}

-(void)beginLogin
{
    NSLog(@"Attempting Login...");
    [self.loading startAnimating];
    self.loginButton.enabled = NO;
    [self.userNameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

-(void)endLogin
{
    NSLog(self.user ? @"Loggin Successfull!" : @"Failed to Login!");
    [self.loading stopAnimating];
    self.loginButton.enabled = YES;
}

-(void)resetUI
{
    // Reset Login UI
    self.userNameField.text = @"";
    self.passwordField.text = @"";
    [self endLogin];
    
    
    // Reset User UI
    self.firstNameLabel.text = @"...";
    self.lastNameLabel.text = @"...";
    self.hashLabel.text = @"...";
    self.numberOfSkillsLabel.text = @"0";
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.userNameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

@end
