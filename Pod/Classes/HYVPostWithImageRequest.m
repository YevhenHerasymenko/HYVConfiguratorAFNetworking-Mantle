//
//  HYVBasicPostWithObject.m
//  Pods
//
//  Created by Herasymenko Yevhen on 12.02.15.
//
//

#import "HYVPostWithImageRequest.h"

@implementation HYVPostWithImageRequest

- (void)execute {
    self.operation = [[HYVConfiguratorAFNetworking sharedConfigurator] POST:self.path parameters:self.parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (self.image) {
            [formData appendPartWithFileData:UIImageJPEGRepresentation(self.image, 1.0)
                                        name:self.objectParamKey
                                    fileName:[NSString stringWithFormat:@"%@.jpeg", self.name]
                                    mimeType:@"image/jpeg"];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self executeSuccess:responseObject];
        [self updateSessionWithResponse:operation.response];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self executeError:error];
    }];
}

@end
