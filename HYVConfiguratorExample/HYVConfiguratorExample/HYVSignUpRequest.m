//
//  HYVSignUpRequest.m
//  HYVConfiguratorExample
//
//  Created by Gerasymenko Yevgen on 20.01.15.
//  Copyright (c) 2015 Herasymenko Yevhen. All rights reserved.
//

#import "HYVSignUpRequest.h"

@interface HYVSignUpRequest()

@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *birthDay;
@property (strong, nonatomic) NSString *avatar;
@property (strong, nonatomic) NSString *gender;

@end

@implementation HYVSignUpRequest

@synthesize successBlock = _successBlock;
@synthesize errorBlock = _errorBlock;

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password
                    firstName:(NSString*)firstName lastName:(NSString*)lastName
                     birthDay:(NSString*)birthday gender:(NSInteger)gender
                   completion:(SuccessCompletion)successBlock error:(ErrorCompletion)errorBlock {
    if (self = [super init]) {
        _password = password;
        _email = email;
        _firstName = firstName;
        _lastName = lastName;
        _birthDay = birthday;
        _successBlock = successBlock;
        _errorBlock = errorBlock;
        _gender = [NSString stringWithFormat:@"%li", (long)gender];
    }
    return self;
}

- (NSString *)path {
    return @"/api/sessions/signup.json";
}

- (NSDictionary *)parameters {
    NSMutableDictionary *parametrs = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                       @"user[email]" : self.email,
                                                                                       @"user[first_name]" : self.firstName,
                                                                                       @"user[birthday]" : self.birthDay,
                                                                                       @"user[last_name]" : self.lastName,
                                                                                       @"user[password]" : self.password,
                                                                                       @"user[gender]": self.gender,
                                                                                       @"user[device_type]" : @"ios"
                                                                                       }];
    return parametrs;
}

- (void) executeSuccess:(id)responseObject {
    
}

@end
