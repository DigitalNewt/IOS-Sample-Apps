//
//  SYXmlParser.h
//  BestSoapTool
//
//  Created by Serdar YILLAR on 12/28/12.
//  Copyright (c) 2012 yillars. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SYXmlParser : NSObject <NSXMLParserDelegate>{
	NSURL *URL;
	NSData *dataToParse;
    NSArray *tags;
	NSXMLParser *parser;
	NSString *currentParsedData;
    NSString *currentElement;
	NSMutableString *currentString;
	NSMutableDictionary *item;
	NSMutableArray *theDataArray;
}
- (id)initWithURL:(NSURL *)url;
- (id)initWithData:(NSData *)data;

@property(nonatomic,retain)NSMutableArray *theDataArray;

-(void)startParser;

@end
