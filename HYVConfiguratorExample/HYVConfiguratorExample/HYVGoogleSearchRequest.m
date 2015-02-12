//
//  HYVGoogleSearchRequest.m
//  HYVConfiguratorExample
//
//  Created by Gerasymenko Yevgen on 21.01.15.
//  Copyright (c) 2015 Herasymenko Yevhen. All rights reserved.
//

#import "HYVGoogleSearchRequest.h"

@interface HYVGoogleSearchRequest()

@property (copy, nonatomic) NSString *searchString;

@end

@implementation HYVGoogleSearchRequest

@synthesize successBlock = _successBlock;
@synthesize errorBlock = _errorBlock;

- (instancetype)initWithSearch:(NSString *)searchString success:(SuccessCompletion)succesBlock error:(ErrorCompletion)errorBlock {
    self = [super init];
    if (self) {
        _searchString = searchString;
        _successBlock = succesBlock;
        _errorBlock = errorBlock;
    }
    return self;
}

- (NSString *)path {
    return @"/ajax/services/search/web";
}

- (NSDictionary *)parameters {
    NSMutableDictionary *parametrs = [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                                       @"v" : @"1.0",
                                                                                       @"q" : self.searchString
                                                                                       }];
    return parametrs;
}

- (void) executeSuccess:(id)responseObject {
    
}

@end
