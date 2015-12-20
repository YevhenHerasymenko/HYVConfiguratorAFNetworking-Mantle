//
//  HYVPutWithImageRequest.m
//  Pods
//
//  Created by Herasymenko Yevhen on 12.02.15.
//
//

#import "HYVPutWithImageRequest.h"
#import "HYVConfiguratorAFNetworking.h"

@implementation HYVPutWithImageRequest

- (void)execute {
    NSError *error;
    NSString *path = [NSString stringWithFormat:@"%@%@", [HYVConfiguratorAFNetworking sharedConfigurator].baseUrlString, self.path];
    NSMutableURLRequest *request = [[HYVConfiguratorAFNetworking sharedConfigurator].requestSerializer multipartFormRequestWithMethod:@"PUT" URLString:path parameters:self.parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (self.image) {
            [formData appendPartWithFileData:UIImageJPEGRepresentation(self.image, 1.0)
                                        name:self.objectParamKey
                                    fileName:[NSString stringWithFormat:@"%@.jpeg", self.name]
                                    mimeType:@"image/jpeg"];
        }
    } error:&error];
    
    
    self.dataTask = [[HYVConfiguratorAFNetworking sharedConfigurator] dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [self executeSuccess:responseObject];
            [self updateSessionWithResponse:response];
        } else {
            [self executeError:error];
        }
    }];
}

@end
