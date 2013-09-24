//
//  SYXmlParser.m
//  BestSoapTool
//
//  Created by Serdar YILLAR on 12/28/12.
//  Copyright (c) 2012 yillars. All rights reserved.
//

#import "SYXmlParser.h"

@implementation SYXmlParser

@synthesize theDataArray;

- (id)initWithData:(NSData *)data{
    self = [super init];
	if (self) {
		dataToParse = [data copy];
		URL = nil;
	}
	return self;
}
- (id)initWithURL:(NSURL *)url{
    self = [super init];
	if (self) {
		dataToParse = nil;
		URL = [url copy];
	}
	return self;
}

- (void)showAlert:(NSString *)String{
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:String delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
}

-(void)startParser{
    ////Error --	
	if (dataToParse == nil && URL == nil) {
		NSLog(@"nil parameters..");
		return;
	}
	
	NSString *tagsPath = [[NSBundle mainBundle] pathForResource:@"SYXmlParserTags" ofType:@"plist"];
	tags = [[NSArray alloc]initWithContentsOfFile:tagsPath];
	
	
    ////InitWithData --
	if (dataToParse != nil && URL == nil) {
        theDataArray = [[NSMutableArray alloc]init];
		parser = [[NSXMLParser alloc]initWithData:dataToParse];
		[parser setDelegate:self];
		[parser parse];
	}
	
    ////initWithURL	--
	if (URL != nil && dataToParse == nil) {		
		theDataArray = [[NSMutableArray alloc]init];
		
            
		if ([NSData dataWithContentsOfURL:URL] == nil) {
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Connection Lost" message:@"Internet bağlantısı yok veya\n sunucuya ulaşılamıyor" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			theDataArray = nil;		
		}
		else {
			parser = [[NSXMLParser alloc]initWithData:[NSData dataWithContentsOfURL:URL]];
			[parser setDelegate:self];
			[parser parse];
            
        
		}
	}
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	currentElement = elementName;
	currentString = [[NSMutableString alloc]init];
	
	for (int i=0; i<[tags count]; i++) {
		if ([elementName isEqualToString:[tags objectAtIndex:i]]) {
            item = [[NSMutableDictionary alloc]init];
		}
	}
}	

//// CDATA Block --
-(void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock{
	
	@try {
		currentString = nil;
		currentParsedData = [[NSString alloc]initWithData:CDATABlock encoding:NSUTF8StringEncoding];
		[item setObject:currentParsedData forKey:currentElement];
            
	}
	@catch (NSException * e) {
		NSLog(@"PARSER EXCEPTION foundCDATA: %@",[e description]);
	}
	@finally {
		
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	[currentString appendString:string];
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	for (int i=0; i<[tags count]; i++) {
		if ([elementName isEqualToString:[tags objectAtIndex:i]]) {
			[theDataArray addObject:item];
					
		}
	}
	if(currentString){
		[item setObject:[currentString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:currentElement];
	}
    
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
	[UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
	NSLog(@"Parser Error:%@",[parseError description]);
}

@end
