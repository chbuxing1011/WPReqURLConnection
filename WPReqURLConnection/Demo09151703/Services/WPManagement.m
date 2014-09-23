//
//  WPAFNetWorkManagement.m
//  Demo09150947
//
//  Created by user on 14-9-15.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "WPManagement.h"

@implementation WPManagement
static WPManagement *wp;

+ (instancetype)manager {
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        wp = [super manager];
        [wp.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    });
    return wp;
}


- (AFHTTPRequestOperation *)sendObject:(WPBaseReq *)wpBaseReq
                               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    AFHTTPRequestOperation *operation;
    
    if ([wpBaseReq.HTTPMethod isEqualToString:kHTTPMETHODGET]) {
        [[WPManagement manager] GET:wpBaseReq.URL parameters:wpBaseReq.dictionaryRepresentation success:^(AFHTTPRequestOperation *operation, id responseObject) {
            success(operation,responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(operation,error);
        }];
    }else{
        [[WPManagement manager] POST:wpBaseReq.URL parameters:wpBaseReq.dictionaryRepresentation success:^(AFHTTPRequestOperation *operation, id responseObject) {
            success(operation,responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(operation,error);
        }];
    }
    return operation;
}

@end
