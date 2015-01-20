//
//  HYVBasicRequest.m
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import "HYVBasicRequest.h"

@implementation HYVBasicRequest

@synthesize parameters;
@synthesize path;
@synthesize executing;
@synthesize succesObjectClass;

- (void)execute { }

- (void)executeSuccess:(id)responseObject { }

- (void)executeError:(NSError *)error { }


- (void)updateSessionWithResponse:(NSURLResponse *)response {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        NSDictionary *dictionary = [httpResponse allHeaderFields];
        if ([dictionary objectForKey:[HYVConfiguratorAFNetworking sharedConfigurator].sessionKey]) {
            NSString *token = [dictionary objectForKey:[HYVConfiguratorAFNetworking sharedConfigurator].sessionKey];
            [[HYVConfiguratorAFNetworking sharedConfigurator] setValue:token
                                                    forHTTPHeaderField:[HYVConfiguratorAFNetworking sharedConfigurator].sessionKey];
            [[NSUserDefaults standardUserDefaults] setValue:token forKey:[HYVConfiguratorAFNetworking sharedConfigurator].sessionKey];
        }
    }
}

@end
