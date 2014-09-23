//
//  KuaiD.m
//
//  Created by user  on 14-9-15
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "KuaiD.h"
#import "Data.h"


NSString *const kKuaiDStatus = @"status";
NSString *const kKuaiDNu = @"nu";
NSString *const kKuaiDIscheck = @"ischeck";
NSString *const kKuaiDUpdatetime = @"updatetime";
NSString *const kKuaiDCondition = @"condition";
NSString *const kKuaiDData = @"data";
NSString *const kKuaiDMessage = @"message";
NSString *const kKuaiDCom = @"com";
NSString *const kKuaiDState = @"state";


@interface KuaiD ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation KuaiD

@synthesize status = _status;
@synthesize nu = _nu;
@synthesize ischeck = _ischeck;
@synthesize updatetime = _updatetime;
@synthesize condition = _condition;
@synthesize data = _data;
@synthesize message = _message;
@synthesize com = _com;
@synthesize state = _state;


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
            self.status = [self objectOrNilForKey:kKuaiDStatus fromDictionary:dict];
            self.nu = [self objectOrNilForKey:kKuaiDNu fromDictionary:dict];
            self.ischeck = [self objectOrNilForKey:kKuaiDIscheck fromDictionary:dict];
            self.updatetime = [self objectOrNilForKey:kKuaiDUpdatetime fromDictionary:dict];
            self.condition = [self objectOrNilForKey:kKuaiDCondition fromDictionary:dict];
    NSObject *receivedData = [dict objectForKey:kKuaiDData];
    NSMutableArray *parsedData = [NSMutableArray array];
    if ([receivedData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedData addObject:[Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedData isKindOfClass:[NSDictionary class]]) {
       [parsedData addObject:[Data modelObjectWithDictionary:(NSDictionary *)receivedData]];
    }

    self.data = [NSArray arrayWithArray:parsedData];
            self.message = [self objectOrNilForKey:kKuaiDMessage fromDictionary:dict];
            self.com = [self objectOrNilForKey:kKuaiDCom fromDictionary:dict];
            self.state = [self objectOrNilForKey:kKuaiDState fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kKuaiDStatus];
    [mutableDict setValue:self.nu forKey:kKuaiDNu];
    [mutableDict setValue:self.ischeck forKey:kKuaiDIscheck];
    [mutableDict setValue:self.updatetime forKey:kKuaiDUpdatetime];
    [mutableDict setValue:self.condition forKey:kKuaiDCondition];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kKuaiDData];
    [mutableDict setValue:self.message forKey:kKuaiDMessage];
    [mutableDict setValue:self.com forKey:kKuaiDCom];
    [mutableDict setValue:self.state forKey:kKuaiDState];

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

    self.status = [aDecoder decodeObjectForKey:kKuaiDStatus];
    self.nu = [aDecoder decodeObjectForKey:kKuaiDNu];
    self.ischeck = [aDecoder decodeObjectForKey:kKuaiDIscheck];
    self.updatetime = [aDecoder decodeObjectForKey:kKuaiDUpdatetime];
    self.condition = [aDecoder decodeObjectForKey:kKuaiDCondition];
    self.data = [aDecoder decodeObjectForKey:kKuaiDData];
    self.message = [aDecoder decodeObjectForKey:kKuaiDMessage];
    self.com = [aDecoder decodeObjectForKey:kKuaiDCom];
    self.state = [aDecoder decodeObjectForKey:kKuaiDState];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kKuaiDStatus];
    [aCoder encodeObject:_nu forKey:kKuaiDNu];
    [aCoder encodeObject:_ischeck forKey:kKuaiDIscheck];
    [aCoder encodeObject:_updatetime forKey:kKuaiDUpdatetime];
    [aCoder encodeObject:_condition forKey:kKuaiDCondition];
    [aCoder encodeObject:_data forKey:kKuaiDData];
    [aCoder encodeObject:_message forKey:kKuaiDMessage];
    [aCoder encodeObject:_com forKey:kKuaiDCom];
    [aCoder encodeObject:_state forKey:kKuaiDState];
}

- (id)copyWithZone:(NSZone *)zone
{
    KuaiD *copy = [[KuaiD alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.nu = [self.nu copyWithZone:zone];
        copy.ischeck = [self.ischeck copyWithZone:zone];
        copy.updatetime = [self.updatetime copyWithZone:zone];
        copy.condition = [self.condition copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.message = [self.message copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.state = [self.state copyWithZone:zone];
    }
    
    return copy;
}


@end
