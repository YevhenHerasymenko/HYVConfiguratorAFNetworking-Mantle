//
//  HYVBasicDeleteRequest.m
//  Pods
//
//  Created by Gerasymenko Yevgen on 21.01.15.
//
//

#import "HYVBasicDeleteRequest.h"

@implementation HYVBasicDeleteRequest

- (void)execute {
    self.operation = [[HYVConfiguratorAFNetworking sharedConfigurator] DELETE:self.path
                                                  parameters:self.parameters
                                                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                         [self executeSuccess:responseObject];
                                                         [self updateSessionWithResponse:operation.response];
                                                     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                         [self executeError:error];
                                                     }];
}

@end
