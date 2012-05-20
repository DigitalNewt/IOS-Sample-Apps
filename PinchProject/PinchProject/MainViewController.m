//
//  MainViewController.m
//  PinchProject
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (IBAction) zoomMeIn:(UIPinchGestureRecognizer *)recognizer {
    
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}
@end
