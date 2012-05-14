//
//  sliderGameViewController.h
//  sliderGame
//
//  Created by Baker Brent on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sliderGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *myNewValue;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressBar;
@property (weak, nonatomic) IBOutlet UILabel *myResult;

@end
