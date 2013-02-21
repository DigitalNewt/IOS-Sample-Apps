//
//  GameResult.m
//  Matchismo
//
//  Created by Newt on 2/17/13.
//  Copyright (c) 2013 Digital Newt LLC. All rights reserved.
//

#import "GameResult.h"

@interface  GameResult()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;
@end

@implementation GameResult

#define ALL_RESULTS_KEY @"GameResult_ALL"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

+ (NSArray *)allGameResults
{
    NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]) {
        GameResult *result = [[GameResult alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    return allGameResults;
}

// convienience initializer
- (id)initFromPropertyList:(id)plist
{
    self = [self init];
    if (self ) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDictionaly = (NSDictionary *) plist;
            _start = resultDictionaly[START_KEY];
            _end = resultDictionaly[END_KEY];
            _score = [resultDictionaly[SCORE_KEY] intValue];
            if (!_start || !_end) self = nil;
        }
    }
    return self;
}
- (void)synchronize
{
    NSMutableDictionary *mutableGameResltsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableGameResltsFromUserDefaults) mutableGameResltsFromUserDefaults = [[NSMutableDictionary alloc] init];
    mutableGameResltsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResltsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



 - (id)asPropertyList
{
    return @{START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score) };
}

// designated initializer
- (id)init
{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

- (NSTimeInterval)duration
{
    return [self.end timeIntervalSinceDate:self.start];
}

- (void)setScore:(int)score
{
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}
@end
