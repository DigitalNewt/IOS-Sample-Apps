//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Newt on 2/14/13.
//  Copyright (c) 2013 Digital Newt LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

- (Deck *)createDeck; //abstract
@property (nonatomic) NSUInteger startingCardCount; // abstract
- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate; // abstract
@end
