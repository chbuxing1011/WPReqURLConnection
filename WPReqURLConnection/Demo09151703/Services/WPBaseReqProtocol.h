//
//  WPBaseReq.h
//  Demo09150947
//
//  Created by user on 14-9-15.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WPBaseReqProtocol <NSObject>

- (NSString *)HTTPMethod;
- (NSString *)URL;
@end
