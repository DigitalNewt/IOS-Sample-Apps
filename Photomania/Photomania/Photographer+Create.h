//
//  Photographer+Create.h
//  Photomania
//
//  Created by Newt on 3/10/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name
                       inManagedObjectContext:(NSManagedObjectContext *)context;
@end
