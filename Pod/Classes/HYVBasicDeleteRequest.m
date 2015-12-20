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
    self.dataTask = [[HYVConfiguratorAFNetworking sharedConfigurator] DELETE:self.path parameters:self.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self executeSuccess:responseObject];
        [self updateSessionWithResponse:task.response];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self executeError:error];
    }];
}

@end
