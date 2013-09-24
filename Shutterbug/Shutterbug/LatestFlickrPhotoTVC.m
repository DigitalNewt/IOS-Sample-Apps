//
//  LatestFlickerPhotosTVC.m
//  Shutterbug
//
//  Created by Newt on 2/24/13.
//  Copyright (c) 2013 Digital Newt LLC. All rights reserved.
//

#import "LatestFlickrPhotoTVC.h"
#import "FlickrFetcher.h"

@interface LatestFlickrPhotoTVC ()

@end

@implementation LatestFlickrPhotoTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadLatestPhotosFromFlicker];
    [self.refreshControl addTarget:self
                            action:@selector(loadLatestPhotosFromFlicker)
                  forControlEvents:UIControlEventValueChanged];
}

- (void)loadLatestPhotosFromFlicker
{
    [self.refreshControl beginRefreshing];
    dispatch_queue_t loaderQ = dispatch_queue_create("flicker latest loader", NULL);
    dispatch_async(loaderQ, ^{
       NSArray *latestPhotos = [FlickrFetcher latestGeoreferencedPhotos];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.photos = latestPhotos;
            [self.refreshControl endRefreshing];
        });
    });
    
}

@end
