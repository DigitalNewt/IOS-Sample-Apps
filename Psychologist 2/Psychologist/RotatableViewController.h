//
//  RotatableViewController.h
//  Psychologist
//
//  Created by CS193p Instructor.
//  Copyright (c) 2011 Stanford University. All rights reserved.
//
//  Generic, always rotatable view controller.
//  Will play the role of delegate if in a split view.
//  Will do split view bar button dance as long as
//    the detail view controller implements UISplitViewControllerDelegate.

#import <UIKit/UIKit.h>

@interface RotatableViewController : UIViewController <UISplitViewControllerDelegate>

@end
