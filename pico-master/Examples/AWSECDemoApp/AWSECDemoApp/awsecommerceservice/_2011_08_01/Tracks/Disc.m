// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Disc.h"
#import "Track.h"

@implementation Disc

@synthesize track = _track;
@synthesize number = _number;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    return nil;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"Track" propertyName:@"track" type:PICO_TYPE_OBJECT clazz:[Track class]];
    [map setObject:ps forKey:@"track"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ATTRIBUTE xmlName:@"Number" propertyName:@"number" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"number"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.track = nil;
    self.number = nil;
    [super dealloc];
}

@end
