//
//  CMMotionManager+Shared.h
//  KitchenSink
//
//  Created by Newt on 4/14/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//


#import <CoreMotion/CoreMotion.h>

@interface CMMotionManager (Shared)

+ (CMMotionManager *)sharedMotionManager;

@end
