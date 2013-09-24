//
//  Photo+MKAnnotation.h
//  Photomania
//
//  Created by Newt on 3/19/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "Photo.h"
#import <MapKit/MapKit.h>

@interface Photo (MKAnnotation) <MKAnnotation>

- (UIImage *)thumbnail; // blocks!

@end
