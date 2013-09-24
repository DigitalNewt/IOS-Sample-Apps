//
//  Photographer+MKAnnotation.h
//  Photomania
//
//  Created by Newt on 3/19/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "Photographer.h"
#import <MapKit/MapKit.h>

@interface Photographer (MKAnnotation) <MKAnnotation>

- (UIImage *)thumbnail;

@end
