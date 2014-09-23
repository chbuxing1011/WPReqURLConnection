//
//  QueryReq.m
//
//  Created by user  on 14-9-15
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "QueryReq.h"


NSString *const kQueryReqType = @"type";
NSString *const kQueryReqPostid = @"postid";


@interface QueryReq ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QueryReq

@synthesize type = _type;
@synthesize postid = _postid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.type = [self objectOrNilForKey:kQueryReqType fromDictionary:dict];
            self.postid = [self objectOrNilForKey:kQueryReqPostid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kQueryReqType];
    [mutableDict setValue:self.postid forKey:kQueryReqPostid];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.type = [aDecoder decodeObjectForKey:kQueryReqType];
    self.postid = [aDecoder decodeObjectForKey:kQueryReqPostid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kQueryReqType];
    [aCoder encodeObject:_postid forKey:kQueryReqPostid];
}

- (id)copyWithZone:(NSZone *)zone
{
    QueryReq *copy = [[QueryReq alloc] init];
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.postid = [self.postid copyWithZone:zone];
    }
    
    return copy;
}

- (NSString *)HTTPMethod{
    return kHTTPMETHODGET;
}
- (NSString *)URL{
    return @"http://www.kuaidi100.com/query";
}


@end
