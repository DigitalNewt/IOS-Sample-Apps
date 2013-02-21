//
//  MainAppDelegate.h
//  noARC
//
//  Created by Baker Brent on 5/26/12.
//  Copyright (c) 2012 Global Institution. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface MainAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *viewController;

@end
