//
//  HYVBasicRequest.m
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import "HYVBasicRequest.h"
#import "HYVError.h"

@implementation HYVBasicRequest

@synthesize parameters;
@synthesize path;
@synthesize executing;
@synthesize succesObjectClass;
@synthesize errorObjectClass;

static NSString *const kErrorUserInfoJSONKey = @"com.alamofire.serialization.response.error.data";
static NSString *const kErrorUserInfoResponseKey = @"com.alamofire.serialization.response.error.response";
static NSString *const kErrorUserInfoLocalizedDescriptoeResponseKey = @"NSLocalizedDescription";

- (void)execute { }

#pragma mark - Success Response

- (void)executeSuccess:(id)responseObject {
    NSError *parsingSuccess;
    HYVBasicModel *successObject = [MTLJSONAdapter modelOfClass:NSClassFromString(self.succesObjectClass).class fromJSONDictionary:responseObject error:&parsingSuccess];
    self.successBlock(successObject);
}

#pragma mark - Error Response

- (void)executeError:(NSError *)error {
    if ([error.userInfo valueForKey:kErrorUserInfoJSONKey] && [error.userInfo valueForKey:kErrorUserInfoResponseKey]) {
        [self mappingServerErrorResponseWithError:error];
    }
    else {
        [self mappingUserError:error];
    }
}

- (void)mappingServerErrorResponseWithError:(NSError *)error {
    NSError* errorJson;
    NSError *parsingError;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[error.userInfo valueForKey:kErrorUserInfoJSONKey]
                                                         options:kNilOptions
                                                           error:&errorJson];
    HYVBasicModel *errorObject = [MTLJSONAdapter modelOfClass:NSClassFromString(self.errorObjectClass).class fromJSONDictionary:json error:&parsingError];
    NSHTTPURLResponse *response = [error.userInfo valueForKey:kErrorUserInfoResponseKey];
#ifdef DEBUG
    NSLog (@"Error status code:%ld", (long)response.statusCode);
#endif
    errorObject.objectId = [NSNumber numberWithInteger:response.statusCode];
    self.errorBlock(errorObject);
}

- (void)mappingUserError:(NSError *)error {
    HYVError *errorObject = [[HYVError alloc] init];
    
    if ([error.domain isEqualToString:NSCocoaErrorDomain]) {
        error = [error.userInfo objectForKey:NSUnderlyingErrorKey];
    }
    if (error.userInfo) {
        errorObject.message = [error.userInfo valueForKey:kErrorUserInfoLocalizedDescriptoeResponseKey];
    }
    
#ifdef DEBUG
    NSLog (@"%@", errorObject.message);
#endif
    NSAssert(self.errorBlock,@"Error block wasn`t initialize");
    if (self.errorBlock) {
        self.errorBlock(errorObject);
    }
}

#pragma mark - Session

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
