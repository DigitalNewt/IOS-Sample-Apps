//
//  PhotographerCDTVC.h
//  Photomania
//
//  Created by Newt on 3/10/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//
// Can do "setPhotographer:" segue and will call said method in destination VC.

#import "CoreDataTableViewController.h"

@interface PhotographerCDTVC : CoreDataTableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
