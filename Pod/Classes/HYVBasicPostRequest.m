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
                                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                      [self executeSuccess:responseObject];
                                                      [self updateSessionWithResponse:operation.response];
//                                                      NSError *error = nil;
//                                                      NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:operation.request.HTTPBody options:kNilOptions error:&error];
//                                                      self.successBlock(jsonArray);

                                                  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                      [self executeError:error];
//                                                      NSError *errorJ = nil;
//                                                      NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:operation.request.HTTPBody options:kNilOptions error:&errorJ];
//                                                      self.errorBlock(jsonArray);
                                                      
                                                  }];
}

@end
