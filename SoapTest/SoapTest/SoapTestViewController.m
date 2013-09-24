//
//  SoapTestViewController.m
//  SoapTest
//
//  Created by Newt on 4/17/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "SoapTestViewController.h"

@interface SoapTestViewController ()
{
    CustomerService *soapTool;
//    SYSoapTool *soapTool;
}

@end

@implementation SoapTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    soapTool = [[SYSoapTool alloc] init];
//    [soapTool setDelegate:self];
//    
//    [soapTool callSoapServiceWithoutParameters__functionName:@"GetImportTariffPort" wsdlURL:@"http://serdaryillar.com/servis.asmx"];
    
    
    soapTool = [[CustomerService alloc] init];
    
    [soapTool getAll];
    
}

- (void)retriveFromSYSoapTool:(NSMutableArray *)_data
{
    NSLog(@"data: %@", _data);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
