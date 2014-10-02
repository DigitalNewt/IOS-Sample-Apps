//
//  FailedBankDetails.h
//  FailedBankCD
//
//  Created by Newt on 12/18/13.
//  Copyright (c) 2013 Ravetree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FailedBankInfo;

@interface FailedBankDetails : NSManagedObject

@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) NSDate * closeDate;
@property (nonatomic, retain) FailedBankInfo *info;

@end
