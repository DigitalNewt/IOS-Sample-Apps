//
//  MainViewController.h
//  kalrssonMap
//
//  Created by Baker Brent on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MainViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView1;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (void) goLocation;
@end
