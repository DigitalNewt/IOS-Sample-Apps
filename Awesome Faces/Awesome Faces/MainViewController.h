//
//  MainViewController.h
//  Awesome Faces
//
//  Created by Newt on 5/11/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate>
{
    BOOL isUsingFrontFacingCamera;
    BOOL detectFaces;
    CGFloat effectiveScale;
}

@end
