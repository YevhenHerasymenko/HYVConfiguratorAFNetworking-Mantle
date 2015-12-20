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
    self.dataTask = [[HYVConfiguratorAFNetworking sharedConfigurator] POST:self.path parameters:self.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self executeSuccess:responseObject];
        [self updateSessionWithResponse:task.response];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self executeError:error];
    }];
    
}

@end
