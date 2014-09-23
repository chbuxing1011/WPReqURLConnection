//
//  ViewController.m
//  Demo09151703
//
//  Created by user on 14-9-15.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "ViewController.h"
#import "QueryReq.h"
#import "WPManagement.h"
#import "KuaiD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    QueryReq *req = [[QueryReq alloc] init];
    [req setType:@"yunda"];
    [req setPostid:@"3100074176480"];
    [[WPManagement manager] sendObject:req success:^(AFHTTPRequestOperation *operation, id responseObject) {
        KuaiD *d = [KuaiD modelObjectWithDictionary:responseObject];        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
