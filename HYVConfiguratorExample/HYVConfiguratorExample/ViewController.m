//
//  ViewController.m
//  HYVConfiguratorExample
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//  Copyright (c) 2015 Herasymenko Yevhen. All rights reserved.
//

#import "ViewController.h"
#import "HYVSignUpRequest.h"
#import "HYVGoogleSearchRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HYVSignUpRequest *request = [[HYVSignUpRequest alloc] initWithEmail:@"sfghfghfghf@dslf.rt54" password:@"sdfdf4234" firstName:@"werasdf" lastName:@"asdfsfds" birthDay:@"1997-01-21" gender:2 completion:^(HYVBasicModel *response) {
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
