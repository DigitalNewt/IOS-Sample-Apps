//
//  TriggerViewController.m
//  Trigger
//
//  Created by Newt on 4/24/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "TriggerViewController.h"
//#import "NXTSecurity.h"

@interface TriggerViewController ()

@end

@implementation TriggerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    NXTSecurity* service = [[NXTSecurity alloc] init];
    
//	service.logging = YES;
	// service.username = @"username";
	// service.password = @"password";
    
	// Returns NXTTicket*
	/* Used to create a Login Ticket to an NXT System */
//	[service login:self action:@selector(loginHandler:) Company: @"Trigger" UserName: @"Admin_Trigger" Password: @"Trigger"];

    // Returns BOOL
	/* Used to invalidate a Ticket created with Login */
//	[service logout:self action:@selector(logoutHandler:) tick: [[NXTTicket alloc] init]];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Handle the response from login.

//- (void) loginHandler: (id) value {
//    
//	// Handle errors
//	if([value isKindOfClass:[NSError class]]) {
//		NSLog(@"%@", value);
//		return;
//	}
//    
//	// Handle faults
//	if([value isKindOfClass:[SoapFault class]]) {
//		NSLog(@"%@", value);
//		return;
//	}
//    
//    
//	// Do something with the NXTTicket* result
//    NXTTicket* result = (NXTTicket*)value;
//	NSLog(@"login returned the value: %@", result);
//    
//}

// Handle the response from logout.

//- (void) logoutHandler: (BOOL) value {
//    
//    
//	// Do something with the BOOL result
//    
//	NSLog(@"logout returned the value: %@", [NSNumber numberWithBool:value]);
//    
//}

@end
