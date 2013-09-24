//
//  iOSRequest.m
//  WebServiceDemo
//
//  Created by Newt on 4/20/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import "iOSRequest.h"
#import "NSString+WebService.h"

@implementation iOSRequest
+(void)requestToPath:(NSString*)path onCompletion:(RequestCompletionHandler)complete
{
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:path]
                                                  cachePolicy:NSURLCacheStorageAllowedInMemoryOnly
                                              timeoutInterval:10];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:backgroundQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               if (complete) {
                                   complete(result,error);
                               }
                           }];
}

+(void)loginWithUsername:(NSString *)userName
             andPassword:(NSString *)password
            onCompletion:(RequestDictionaryCompletionHandler)complete
{
    userName = [userName URLEncode];
    password = [password URLEncode];
    
    NSString *basePath = @"http://joox.fm/tutorial/index.php?";
    NSString *fullPath = [basePath stringByAppendingFormat:@"user_name=%@&password=%@",userName,password];
    [iOSRequest requestToPath:fullPath onCompletion:^(NSString *result, NSError *error){
        if (error || [result isEqualToString:@""]) {
            //Login Failed
            if (complete) {
                complete(nil);
            }
        } else {
            NSDictionary *user = [result JSON];
            if (complete) {
                complete(user);
            }
        }
    }];
}
@end
