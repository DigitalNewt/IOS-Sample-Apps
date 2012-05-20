//
//  MainViewController.m
//  Dragging
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

-(IBAction) dragMe:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0,0) inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) { 
        CGPoint velocity = [recognizer velocityInView:self.view]; 
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y)); 
        CGFloat slideMult = magnitude / 200; 
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult); 
        float slideFactor = 0.1 * slideMult; 
        
        // Increase for more of a slide 
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor), recognizer.view.center.y + (velocity.y * slideFactor)); 
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width); 
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height); 
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{ recognizer.view.center = finalPoint; 
        } completion:nil];
    }
}
@end
