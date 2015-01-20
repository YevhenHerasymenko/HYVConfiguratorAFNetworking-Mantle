//
//  HYVBasicPostRequest.m
//  Pods
//
//  Created by Gerasymenko Yevgen on 20.01.15.
//
//

#import "HYVBasicPostRequest.h"

@implementation HYVBasicPostRequest

- (void)execute {
    [[HYVConfiguratorAFNetworking sharedConfigurator] POST:self.path
                                               parameters:self.parameters
                                                  success:^(NSURLSessionDataTask *task, id responseObject) {
                                                      [self executeSuccess:responseObject];
                                                      [self updateSessionWithResponse:task.response];
                                                  } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                      [self executeError:error];
                                                  }];
}

@end
