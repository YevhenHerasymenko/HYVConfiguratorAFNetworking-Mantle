//
//  HYVSignUpRequest.h
//  HYVConfiguratorExample
//
//  Created by Gerasymenko Yevgen on 20.01.15.
//  Copyright (c) 2015 Herasymenko Yevhen. All rights reserved.
//

#import "HYVBasicPostRequest.h"
#import "HYVBasicGetRequest.h"

@interface HYVSignUpRequest : HYVBasicPostRequest

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password
                    firstName:(NSString*)firstName lastName:(NSString*)lastName
                     birthDay:(NSString*)birthday gender:(NSInteger)gender
                   completion:(SuccessCompletion)successBlock error:(ErrorCompletion)errorBlock;

@end
