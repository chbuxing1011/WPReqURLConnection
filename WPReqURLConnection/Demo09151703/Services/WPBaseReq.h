//
//  WPBaseReq.h
//  Demo09150947
//
//  Created by user on 14-9-15.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPBaseReqProtocol.h"
#define kHTTPMETHODGET  (@"GET")
#define kHTTPMETHODPOST (@"POST")

@interface WPBaseReq : NSObject<WPBaseReqProtocol>
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
@end
