//
//  FaceView.h
//  Happiness
//
//  Created by Newt on 8/15/12.
//  Copyright (c) 2012 digitalnewt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
