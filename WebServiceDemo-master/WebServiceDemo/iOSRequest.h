//
//  iOSRequest.h
//  WebServiceDemo
//
//  Created by Newt on 4/20/13.
//  Copyright (c) 2013 Andrew Barba. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestCompletionHandler) (NSString*,NSError*);

typedef void(^RequestDictionaryCompletionHandler) (NSDictionary *);

@interface iOSRequest : NSObject
+(void)requestToPath:(NSString*)path onCompletion:(RequestCompletionHandler)complete;

+(void)loginWithUsername:(NSString *)userName
             andPassword:(NSString *)password
            onCompletion:(RequestDictionaryCompletionHandler)complete;
@end
