//
//  FlickrFetcher.h
//
//  Created for Stanford CS193p Winter 2013.
//  Copyright 2013 Stanford University
//  All rights reserved.
//

#import <Foundation/Foundation.h>

#define FLICKR_PHOTO_TITLE @"title"
#define FLICKR_PHOTO_DESCRIPTION @"description._content"
#define FLICKR_PLACE_NAME @"_content"
#define FLICKR_PHOTO_ID @"id"
#define FLICKR_LATITUDE @"latitude"
#define FLICKR_LONGITUDE @"longitude"
#define FLICKR_PHOTO_OWNER @"ownername"
#define FLICKR_PHOTO_PLACE_NAME @"derived_place"
#define FLICKR_TAGS @"tags"

#define NSLOG_FLICKR NO

typedef enum {
	FlickrPhotoFormatSquare = 1,
	FlickrPhotoFormatLarge = 2,
	FlickrPhotoFormatOriginal = 64
} FlickrPhotoFormat;

@interface FlickrFetcher : NSObject

+ (NSArray *)stanfordPhotos;

+ (NSURL *)urlForPhoto:(NSDictionary *)photo format:(FlickrPhotoFormat)format;

+ (NSArray *)latestGeoreferencedPhotos;

@end
