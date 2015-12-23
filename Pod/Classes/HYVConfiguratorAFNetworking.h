//
//  HYVConfiguratorAFNetworking.h
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import <Foundation/Foundation.h>
@import AFNetworking;

static const NSString * kHYVConfiguratorBaseUrl;

@interface HYVConfiguratorAFNetworking : AFHTTPSessionManager

@property (copy, nonatomic) NSString *sessionKey;
@property (readonly, strong, nonatomic) NSString *baseUrlString;

+ (instancetype)sharedConfigurator;
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;
- (void)setBaseUrl:(NSURL *)url;
- (void)updateSessionWithToken:(NSString *)token;

@end
