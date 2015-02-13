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
    self.operation = [[HYVConfiguratorAFNetworking sharedConfigurator] GET:self.path
                                               parameters:self.parameters
                                            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                [self executeSuccess:responseObject];
                                                [self updateSessionWithResponse:operation.response];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self executeError:error];
    }];
}

@end
