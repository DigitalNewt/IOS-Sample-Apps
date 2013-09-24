//
//  SYSoapTool.h
//  BestSoapTool
//
//  Created by Serdar YILLAR on 12/28/12.
//  Copyright (c) 2012 yillars. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


#pragma mark protocol
@protocol SOAPToolDelegate
-(void)retriveFromSYSoapTool:(NSMutableArray *)_data;
@end
#pragma end



@interface SYSoapTool : NSObject<NSXMLParserDelegate>{
    id <NSObject, SOAPToolDelegate > delegate;
}
@property (retain) id <NSObject, SOAPToolDelegate > delegate;

-(void)callSoapServiceWithParameters__functionName:(NSString*)___functionName tags:(NSMutableArray*)___tags vars:(NSMutableArray*)___vars wsdlURL:(NSString*)___url;
-(void)callSoapServiceWithoutParameters__functionName:(NSString*)___functionName wsdlURL:(NSString*)___url;

@end
