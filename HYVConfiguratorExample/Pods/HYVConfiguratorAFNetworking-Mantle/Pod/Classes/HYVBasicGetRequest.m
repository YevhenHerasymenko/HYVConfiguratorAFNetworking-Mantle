//
//  HYVBasicGetRequest.m
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import "HYVBasicGetRequest.h"

@implementation HYVBasicGetRequest

- (void)execute {
    [[HYVConfiguratorAFNetworking sharedConfigurator] GET:self.path
                                               parameters:self.parameters
                                            success:^(NSURLSessionDataTask *task, id responseObject) {
                                                [self executeSuccess:responseObject];
                                                [self updateSessionWithResponse:task.response];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self executeError:error];
    }];
}

@end
