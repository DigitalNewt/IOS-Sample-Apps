/*
	NXTSecurityUser.h
	The implementation of properties and methods for the NXTSecurityUser object.
	Generated by SudzC.com
*/
#import "NXTSecurityUser.h"

@implementation NXTSecurityUser
	@synthesize LoginName = _LoginName;
	@synthesize UserGUID = _UserGUID;
	@synthesize CompanyName = _CompanyName;
	@synthesize CompanyUID = _CompanyUID;
	@synthesize ContactUID = _ContactUID;
	@synthesize ContactGUID = _ContactGUID;
	@synthesize Role = _Role;

	- (id) init
	{
		if(self = [super init])
		{
			self.LoginName = nil;
			self.UserGUID = nil;
			self.CompanyName = nil;
			self.CompanyUID = nil;
			self.ContactUID = nil;
			self.ContactGUID = nil;
			self.Role = nil;

		}
		return self;
	}

	+ (NXTSecurityUser*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (NXTSecurityUser*)[[[NXTSecurityUser alloc] initWithNode: node] autorelease];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.LoginName = [Soap getNodeValue: node withName: @"LoginName"];
			self.UserGUID = [Soap getNodeValue: node withName: @"UserGUID"];
			self.CompanyName = [Soap getNodeValue: node withName: @"CompanyName"];
			self.CompanyUID = [Soap getNodeValue: node withName: @"CompanyUID"];
			self.ContactUID = [Soap getNodeValue: node withName: @"ContactUID"];
			self.ContactGUID = [Soap getNodeValue: node withName: @"ContactGUID"];
			self.Role = [Soap getNodeValue: node withName: @"Role"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"SecurityUser"];
	}
  
	- (NSMutableString*) serialize: (NSString*) nodeName
	{
		NSMutableString* s = [NSMutableString string];
		[s appendFormat: @"<%@", nodeName];
		[s appendString: [self serializeAttributes]];
		[s appendString: @">"];
		[s appendString: [self serializeElements]];
		[s appendFormat: @"</%@>", nodeName];
		return s;
	}
	
	- (NSMutableString*) serializeElements
	{
		NSMutableString* s = [super serializeElements];
		if (self.LoginName != nil) [s appendFormat: @"<LoginName>%@</LoginName>", [[self.LoginName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.UserGUID != nil) [s appendFormat: @"<UserGUID>%@</UserGUID>", [[self.UserGUID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.CompanyName != nil) [s appendFormat: @"<CompanyName>%@</CompanyName>", [[self.CompanyName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.CompanyUID != nil) [s appendFormat: @"<CompanyUID>%@</CompanyUID>", [[self.CompanyUID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ContactUID != nil) [s appendFormat: @"<ContactUID>%@</ContactUID>", [[self.ContactUID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ContactGUID != nil) [s appendFormat: @"<ContactGUID>%@</ContactGUID>", [[self.ContactGUID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Role != nil) [s appendFormat: @"<Role>%@</Role>", [[self.Role stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[NXTSecurityUser class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}
	
	- (void) dealloc
	{
		if(self.LoginName != nil) { [self.LoginName release]; }
		if(self.UserGUID != nil) { [self.UserGUID release]; }
		if(self.CompanyName != nil) { [self.CompanyName release]; }
		if(self.CompanyUID != nil) { [self.CompanyUID release]; }
		if(self.ContactUID != nil) { [self.ContactUID release]; }
		if(self.ContactGUID != nil) { [self.ContactGUID release]; }
		if(self.Role != nil) { [self.Role release]; }
		[super dealloc];
	}

@end
