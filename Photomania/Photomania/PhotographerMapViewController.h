//
//  PhotographerMapViewController.h
//  Photomania
//
//  Created by Newt on 3/19/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "MapViewController.h"

@interface PhotographerMapViewController : MapViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (void)reload;

@end
