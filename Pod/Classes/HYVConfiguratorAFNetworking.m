//
//  HYVConfiguratorAFNetworking.m
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import "HYVConfiguratorAFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"


@interface HYVConfiguratorAFNetworking()

@end

@implementation HYVConfiguratorAFNetworking

+ (instancetype)sharedConfigurator {
    static HYVConfiguratorAFNetworking *sharedConfigurator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConfigurator = [[HYVConfiguratorAFNetworking alloc] initWithBaseURL:nil];
        
        NSMutableSet *acceptableContentTypes = [sharedConfigurator.responseSerializer.acceptableContentTypes mutableCopy];
        
        [acceptableContentTypes addObject:@"text/plain"];
        [acceptableContentTypes addObject:@"application/json"];
        [acceptableContentTypes addObject:@"text/html"];
        [acceptableContentTypes addObject:@"application/x-www-form-urlencoded"];
        sharedConfigurator.responseSerializer.acceptableContentTypes = [acceptableContentTypes copy];
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    });
    
    return sharedConfigurator;
}

- (void)setBaseUrl:(NSURL *)url {
    [self setValue:url forKey:@"baseURL"];
}

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field {
    [self.requestSerializer setValue:value forHTTPHeaderField:field];
}

- (void)updateSessionWithToken:(NSString *)token {
    [self setValue:token forHTTPHeaderField:self.sessionKey];
}

@end
