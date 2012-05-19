//
//  myHouseMapViewController.h
//  myHouseMap
//
//  Created by Baker Brent on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface myHouseMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void) goLocation;
@end
