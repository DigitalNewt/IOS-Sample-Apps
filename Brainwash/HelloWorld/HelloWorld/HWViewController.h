//
//  HWViewController.h
//  HelloWorld
//
//  Created by Newt on 1/24/13.
//  Copyright (c) 2013 Brainwashinc.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblHelloWorld;
- (IBAction)doBtnHide:(id)sender;
@end
