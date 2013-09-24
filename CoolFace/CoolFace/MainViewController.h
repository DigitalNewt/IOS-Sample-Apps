//
//  MainViewController.h
//  CoolFace
//
//  Created by Newt on 5/9/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController <UIGestureRecognizerDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>

{
    BOOL isUsingFrontFacingCamera;
    BOOL detectFaces;
    CGFloat effectiveScale;
}

@property (nonatomic, weak) IBOutlet UIView *previewView;

@end
