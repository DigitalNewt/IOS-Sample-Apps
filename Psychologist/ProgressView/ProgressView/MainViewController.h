//
//  MainViewController.h
//  ProgressView
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 Global Institution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{NSTimer *timer;}
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

- (void) moreProgress;
@end
