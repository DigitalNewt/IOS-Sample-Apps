//
//  CustomerService.m
//  SoapTest
//
//  Created by Newt on 4/18/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "CustomerService.h"
#import "AFHTTPRequestOperation.h"

@implementation CustomerService

- (NSMutableArray *)getAll
{
 
    NSURL *url = [NSURL URLWithString:@"http://highoncoding.com/customers.asmx?op=Customers"];
    
    NSString *soapBody = [NSString stringWithFormat:
                          @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                          "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                          "  <soap:Body>\n"
                          "    <Customers xmlns=\"http://tempuri.org/\" />\n"
                          "  </soap:Body>\n"
                          "</soap:Envelope>\n"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPBody:[soapBody dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"http://tempuri.org/Customers" forHTTPHeaderField:@"SOAPAction"];
    [request addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Context-Type"];
     NSString *msgLength = [NSString stringWithFormat:@"%d",[soapBody length]];
    [request addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
   
        NSLog(@"success");

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failed");
        NSLog(@"%@", [error localizedDescription]);
    }];
    
    [operation start];
    return nil;
}
@end
