//
//  HYVSignUpRequest.m
//  HYVConfiguratorExample
//
//  Created by Gerasymenko Yevgen on 20.01.15.
//  Copyright (c) 2015 Herasymenko Yevhen. All rights reserved.
//

#import "HYVSignUpRequest.h"
#import "HYVUser.h"

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
    return @"api/users/sign_in.json";
}

- (NSString *)errorObjectClass {
    return @"HYVBasicModel";
}

- (NSString *)succesObjectClass {
    return @"HYVUser";
}

- (NSDictionary *)parameters {
    return @{ @"user" : @{ @"email" : self.email,
                           @"first_name" : self.firstName,
                           @"birthday" : self.birthDay,
                           @"last_name" : self.lastName,
                           @"password" : self.password,
                           @"gender": self.gender,
                           @"device_type" : @"ios"}
              
              };
}
/*
{
    "user[birthday]" = "1997-01-21";
    "user[device_type]" = ios;
    "user[email]" = "fghfgh@sdf.tu";
    "user[first_name]" = fghfghfghfghf;
    "user[gender]" = 1;
    "user[last_name]" = fghfghfg;
    "user[password]" = dffdg13434;
}
*/
//- (void)executeSuccess:(id)responseObject {
//    NSError *error = nil;
//    HYVUser *user = [MTLJSONAdapter modelOfClass:HYVUser.class fromJSONDictionary:responseObject error:&error];
//    self.successBlock(user);
//}

@end
