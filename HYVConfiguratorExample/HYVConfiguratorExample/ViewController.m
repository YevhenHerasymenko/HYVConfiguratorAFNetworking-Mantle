//
//  ViewController.m
//  HYVConfiguratorExample
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//  Copyright (c) 2015 Herasymenko Yevhen. All rights reserved.
//

#import "ViewController.h"
#import "HYVSignUpRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HYVSignUpRequest *request = [[HYVSignUpRequest alloc] initWithEmail:@"fess222@dsf.rt" password:@"sdfdsf34234" firstName:@"qwerasdf" lastName:@"asdfsfds" birthDay:@"1970-12-12" gender:1 completion:^(HYVBasicModel *response) {
        NSLog(@"%@", response);
    } error:^(HYVBasicModel *response) {
        NSLog(@"%@", response);
    }];
    [request execute];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
