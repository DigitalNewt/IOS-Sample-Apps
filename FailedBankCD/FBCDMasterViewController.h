//
//  FBCDMasterViewController.h
//  FailedBankCD
//
//  Created by Brent Baker on 12/18/13.
//  Copyright (c) 2013 Ravetree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBCDMasterViewController : UITableViewController
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, strong) NSArray *failedBankInfos;
@end
