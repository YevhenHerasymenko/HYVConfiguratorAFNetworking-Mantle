//
//  HYVConfiguratorAFNetworking.h
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HYVConfiguratorAFNetworking : AFHTTPSessionManager

@property (copy, nonatomic) NSString *sessionKey;

+ (instancetype)sharedConfigurator;
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;
- (void)updateSessionWithToken:(NSString *)token;

@end
