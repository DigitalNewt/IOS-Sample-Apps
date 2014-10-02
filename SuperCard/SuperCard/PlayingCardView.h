//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Newt on 2/17/13.
//  Copyright (c) 2013 Digital Newt LLC. All rights reserved.
//

@import UIKit;

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;

@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
