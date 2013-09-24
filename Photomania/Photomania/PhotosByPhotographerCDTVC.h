//
//  PhotosByPhotographerCDTVC.h
//  Photomania
//
//  Created by Newt on 3/10/13.
//  Copyright (c) 2013 Mobile Newt LLC. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Photographer.h"

@interface PhotosByPhotographerCDTVC : CoreDataTableViewController

@property (nonatomic, strong) Photographer *photographer;

@end
