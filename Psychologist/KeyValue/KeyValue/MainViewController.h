//
//  MainViewController.h
//  KeyValue
//
//  Created by Baker Brent on 6/10/12.
//  Copyright (c) 2012 Global Institution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate> {
    NSString *myTextField;
}
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end
