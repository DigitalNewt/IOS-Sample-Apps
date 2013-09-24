//
//  CMMotionManager+Shared.m
//  KitchenSink
//
//  Created by Newt on 4/14/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "CMMotionManager+Shared.h"

@implementation CMMotionManager (Shared)

+ (CMMotionManager *)sharedMotionManager
{
    static CMMotionManager *shared = nil;
    if (!shared) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
          shared = [[CMMotionManager alloc] init];  
        });
    }
    return shared;
}

@end
