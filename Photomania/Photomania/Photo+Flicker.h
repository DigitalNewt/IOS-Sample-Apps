//
//  Photo+Flicker.h
//  Photomania
//
//  Created by Newt on 3/10/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flicker)

+ (Photo *)photoWithFlickerInfo:(NSDictionary *)photoDictionary
         inManagedObjectContext:(NSManagedObjectContext *)context;

@end
