//
//  GameResult.h
//  Matchismo
//
//  Created by Newt on 2/17/13.
//  Copyright (c) 2013 Digital Newt LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+ (NSArray *)allGameResults; // of GameResutl

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

@end
