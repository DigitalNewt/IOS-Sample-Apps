//
//  MainViewController.h
//  TapProject
//
//  Created by Baker Brent on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

- (IBAction)handelMyTap:(UITapGestureRecognizer *)recognized;

@end
