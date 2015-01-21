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
@synthesize errorObjectClass;

- (void)execute { }

- (void)executeSuccess:(id)responseObject {
    NSError *parsingSuccess;
    HYVBasicModel *successObject = [MTLJSONAdapter modelOfClass:NSClassFromString(self.succesObjectClass).class fromJSONDictionary:responseObject error:&parsingSuccess];
    self.successBlock(successObject);
}

- (void)executeError:(NSError *)error {
    NSError* errorJson;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"]
                                                         options:kNilOptions
                                                           error:&errorJson];
    NSHTTPURLResponse *response = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.response"];
    NSLog (@"Error status code:%ld", (long)response.statusCode);
    NSError *parsingError;
    HYVBasicModel *errorObject = [MTLJSONAdapter modelOfClass:NSClassFromString(self.errorObjectClass).class fromJSONDictionary:json error:&parsingError];
    self.errorBlock(errorObject);
}


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
