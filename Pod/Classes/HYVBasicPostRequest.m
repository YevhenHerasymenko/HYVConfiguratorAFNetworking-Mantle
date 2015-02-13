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
    self.operation = [[HYVConfiguratorAFNetworking sharedConfigurator] POST:self.path
                                               parameters:self.parameters
                                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                      [self executeSuccess:responseObject];
                                                      [self updateSessionWithResponse:operation.response];

                                                  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                      [self executeError:error];
                                                  }];
}

@end
