//
//  FailedBankInfo.h
//  FailedBankCD
//
//  Created by Newt on 12/18/13.
//  Copyright (c) 2013 Ravetree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FailedBankDetails;

@interface FailedBankInfo : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) FailedBankDetails *details;

@end
