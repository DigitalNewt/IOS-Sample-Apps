//
//  MainViewController.m
//  kalrssonMap
//
//  Created by Baker Brent on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize mapView1;
@synthesize myLabel;

- (void)viewDidLoad
{
    [self goLocation]; 
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
        myLabel.text = @"Hi!";
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
    if (!pinView) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"];
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = rightButton;
    } else {
        pinView.annotation = annotation;
    }
    return pinView;
}

- (void) goLocation{
    mapView1.mapType= MKMapTypeSatellite;
    
    //Create region
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
    [annotation setSubtitle:@"Welcome!"];
    [self.mapView1 removeAnnotations:self.mapView1.annotations];
    [self.mapView1 addAnnotation:annotation];
    
    [self.mapView1 setRegion:newRegion animated:YES];
}

@end
