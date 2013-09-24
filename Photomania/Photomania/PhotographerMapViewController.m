//
//  PhotographerMapViewController.m
//  Photomania
//
//  Created by Newt on 3/19/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "PhotographerMapViewController.h"
#import <CoreData/CoreData.h>
#import "Photographer+MKAnnotation.h"

@implementation PhotographerMapViewController

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    if (self.view.window) [self reload];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reload];
}

- (void)reload
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
    request.predicate = [NSPredicate predicateWithFormat:@"photos.@count > 2"];
    NSArray *photographers = [self.managedObjectContext executeFetchRequest:request error:NULL];
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:photographers];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"setPhotographer"]) {
        if ([sender isKindOfClass:[MKAnnotationView class]]) {
            MKAnnotationView *aView = sender;
            if ([aView.annotation isKindOfClass:[Photographer class]]) {
                Photographer *photographer = aView.annotation;
                if ([segue.destinationViewController respondsToSelector:@selector(setPhotographer:)]) {
                    [segue.destinationViewController performSelector:@selector(setPhotographer:) withObject:photographer];
                }
            }
        }
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self performSegueWithIdentifier:@"setPhotographer" sender:view];
}

@end
