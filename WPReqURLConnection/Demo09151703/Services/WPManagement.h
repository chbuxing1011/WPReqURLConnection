//
//  WPAFNetWorkManagement.h
//  Demo09150947
//
//  Created by user on 14-9-15.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "WPBaseReq.h"

@interface WPManagement : AFHTTPRequestOperationManager


- (AFHTTPRequestOperation *)sendObject:(WPBaseReq *)wpBaseReq
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
