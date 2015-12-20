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
    self.dataTask = [[HYVConfiguratorAFNetworking sharedConfigurator] POST:self.path parameters:self.parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (self.image) {
            [formData appendPartWithFileData:UIImageJPEGRepresentation(self.image, 1.0)
                                        name:self.objectParamKey
                                    fileName:[NSString stringWithFormat:@"%@.jpeg", self.name]
                                    mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self executeSuccess:responseObject];
        [self updateSessionWithResponse:task.response];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self executeError:error];
    }];
}

@end
