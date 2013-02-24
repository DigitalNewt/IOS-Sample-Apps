//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Brent Baker on 2/14/13.
//  Copyright (c) 2013 Digital Newt LLC. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "GameResult.h"

@interface CardGameViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipCount;

@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) GameResult *gameResult;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@end

@implementation CardGameViewController

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.startingCardCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard"
                                                                           forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card animate:NO];
    return cell;
}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate
{
    // abstract
}

- (GameResult *)gameResult
{
    if (!_gameResult) _gameResult = [[GameResult alloc] init];
    return _gameResult;
}

- (CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount
                                                         usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck { return nil; } // abstract

- (void)updateUI:(NSInteger)itemFlipped {

    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]){
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        if (itemFlipped == indexPath.item) {
            [self updateCell:cell usingCard:card animate:YES];
        } else {
            [self updateCell:cell usingCard:card animate:NO];
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",
                            self.game.score];
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    self.gameResult.score = self.game.score;
}

- (IBAction)deal
{
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;    
    [self updateUI: 0];
}

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture {
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        [self.game flipCardAtIndex: indexPath.item];
        self.flipCount++;
        [self updateUI: indexPath.item];
        self.gameResult.score = self.game.score;
    }
}


@end
