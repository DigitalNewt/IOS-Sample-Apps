//
//  HelloWorldViewController.h
//  HelloWorld
//
//  Created by Baker Brent on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldViewController : UIViewController <UITextFieldDelegate> {
    NSString *userName;
}
@property (nonatomic, copy) NSString *userName;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)changeGreeting:(id)sender;
@end
