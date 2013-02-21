//
//  HappinessViewController.h
//  Happiness
//
//  Created by Newt on 8/15/12.
//  Copyright (c) 2012 digitalnewt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplitViewBarButtonItemPresenter.h"

@interface HappinessViewController : UIViewController <SplitViewBarButtonItemPresenter>

@property (nonatomic) int happiness; // 0 is sad; 100 is very happy

@end
