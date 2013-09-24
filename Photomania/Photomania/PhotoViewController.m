//
//  PhotoViewController.m
//  Photomania
//
//  Created by Newt on 3/25/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "PhotoViewController.h"
#import "MapViewController.h"
#import "Photo+MKAnnotation.h"

@interface PhotoViewController ()
@property (nonatomic, strong) MapViewController *mapvc;
@end

@implementation PhotoViewController

- (void)setPhoto:(Photo *)photo
{
    _photo = photo;
    self.title = self.photo.title;
    self.imageURL = [NSURL URLWithString:self.photo.imageURL];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapvc.mapView addAnnotation:self.photo];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Embed Map of Photo"]) {
        if ([segue.destinationViewController isKindOfClass:[MapViewController class]]) {
            self.mapvc = segue.destinationViewController;
        }
    }
}

@end
