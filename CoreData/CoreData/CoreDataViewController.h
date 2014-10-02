//
//  CoreDataViewController.h
//  CoreData
//
//  Created by Brent Baker on 12/30/13.
//  Copyright (c) 2013 Ravetree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UILabel *status;
- (IBAction)saveData:(id)sender;
- (IBAction)findContact:(id)sender;


@end
