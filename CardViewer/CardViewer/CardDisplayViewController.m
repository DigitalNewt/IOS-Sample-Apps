//
//  CardDisplayViewController.m
//  CardViewer
//
//  Created by Newt on 2/23/13.
//  Copyright (c) 2013 Digital Newt LLC. All rights reserved.
//

#import "CardDisplayViewController.h"
#import "PlayingCardView.h"

@interface CardDisplayViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *PlayingCardView;
@end

@implementation CardDisplayViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.PlayingCardView.rank = self.rank;
    self.PlayingCardView.suit = self.suit;
    self.PlayingCardView.faceUp = YES;
}

@end
