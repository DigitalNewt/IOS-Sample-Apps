//
//  NSString+WebService.m
//  WebServiceDemo
//
//  Created by Newt on 4/20/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "NSString+WebService.h"

@implementation NSString (WebService)

-(NSString *)URLEncode
{
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                     NULL,
                                                                     (__bridge CFStringRef)self,
                                                                     NULL,
                                                                     (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                     kCFStringEncodingUTF8));
    
}

-(id)JSON
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [NSJSONSerialization JSONObjectWithData:data
                                           options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers
                                             error:nil];
}
@end
