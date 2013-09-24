//
//  Photo+Flicker.m
//  Photomania
//
//  Created by Newt on 3/10/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "Photo+Flicker.h"
#import "FlickrFetcher.h"
#import "Photographer+Create.h"

@implementation Photo (Flicker)

+ (Photo *)photoWithFlickerInfo:(NSDictionary *)photoDictionary
         inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photo *photo = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", [photoDictionary[FLICKR_PHOTO_ID] description]];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if (![matches count]) {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];
        
        photo.unique = [photoDictionary[FLICKR_PHOTO_ID] description];
        photo.title = [photoDictionary[FLICKR_PHOTO_TITLE] description];
        photo.subtitle = [[photoDictionary valueForKeyPath:FLICKR_PHOTO_DESCRIPTION] description];
        photo.imageURL = [[FlickrFetcher urlForPhoto:photoDictionary format:FlickrPhotoFormatLarge] absoluteString];
        if (photoDictionary[FLICKR_LATITUDE] != 0 && photoDictionary[FLICKR_LONGITUDE] != 0) {
            photo.latitude = photoDictionary[FLICKR_LATITUDE];
            photo.longitude = photoDictionary[FLICKR_LONGITUDE];
        }
        photo.thumbnailURLString = [[FlickrFetcher urlForPhoto:photoDictionary format:FlickrPhotoFormatSquare] absoluteString];
        
        NSString *photographerName = [photoDictionary[FLICKR_PHOTO_OWNER] description];
        Photographer *photographer = [Photographer photographerWithName:photographerName inManagedObjectContext:context];
        photo.whoTook = photographer;
    } else {
        photo = [matches lastObject];
    }
    
    return photo;
}

@end
