//
//  PlayingCard.h
//  Matchismo
//
//  Created by Newt on 2/14/13.
//  Copyright (c) 2013 Digital Newt LLC. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
