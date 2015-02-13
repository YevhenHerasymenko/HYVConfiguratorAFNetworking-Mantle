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
    
    
    self.operation =  [[HYVConfiguratorAFNetworking sharedConfigurator] HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self executeSuccess:responseObject];
        [self updateSessionWithResponse:operation.response];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self executeError:error];
    }];
    [AFURLConnectionOperation batchOfRequestOperations:@[self.operation] progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
        NSLog(@"%lu of %lu complete", (unsigned long)numberOfFinishedOperations, (unsigned long)totalNumberOfOperations);
    } completionBlock:^(NSArray *operations) {
        NSLog(@"All operations in batch complete");
    }];
    [[NSOperationQueue mainQueue] addOperations:@[self.operation] waitUntilFinished:NO];
}

@end
