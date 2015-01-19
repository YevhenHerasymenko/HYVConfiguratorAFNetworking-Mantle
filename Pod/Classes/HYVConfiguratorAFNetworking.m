//
//  HYVConfiguratorAFNetworking.m
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import "HYVConfiguratorAFNetworking.h"

@interface HYVConfiguratorAFNetworking()

@end

@implementation HYVConfiguratorAFNetworking

+ (instancetype)sharedConfigurator {
    static HYVConfiguratorAFNetworking *sharedConfigurator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConfigurator = [[HYVConfiguratorAFNetworking alloc] init];
        sharedConfigurator.requestSerializer = [[AFJSONRequestSerializer alloc] init];
        
        NSMutableSet *acceptableContentTypes = [sharedConfigurator.responseSerializer.acceptableContentTypes mutableCopy];
        [acceptableContentTypes addObject:@"text/html"];
        [acceptableContentTypes addObject:@"text/plain"];
        sharedConfigurator.responseSerializer.acceptableContentTypes = [acceptableContentTypes copy];
    });
    
    return sharedConfigurator;
}

- (void)setBaseUrl:(NSURL *)baseUrl {
    [self setBaseUrl:baseUrl];
}

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field {
    [self.requestSerializer setValue:value forHTTPHeaderField:field];
}

- (void)updateSessionWithToken:(NSString *)token {
    [self setValue:token forHTTPHeaderField:self.sessionKey];
}

@end
