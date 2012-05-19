//
//  myHouseMapViewController.m
//  myHouseMap
//
//  Created by Baker Brent on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "myHouseMapViewController.h"

@implementation myHouseMapViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [self goLocation];    
    [super viewDidLoad];
}

- (void) goLocation{
    //Create region
    mapView.mapType= MKMapTypeSatellite;
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 33.675435;
    newRegion.center.longitude = 35.466281;
    newRegion.span.latitudeDelta = 0.002411;
    newRegion.span.longitudeDelta = 0.004576;
    
    CLLocationCoordinate2D coordinatie;
    coordinatie.latitude = 33.675435;
    coordinatie.longitude = 35.466281;
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coordinatie];
    [annotation setTitle:@"DigitalNewt's House"];
//    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:annotation];
    
    [self.mapView setRegion:newRegion animated:YES];
}

@end
