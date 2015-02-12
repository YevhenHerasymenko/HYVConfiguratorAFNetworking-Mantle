//
//  HYVGoogleSearchRequest.h
//  HYVConfiguratorExample
//
//  Created by Gerasymenko Yevgen on 21.01.15.
//  Copyright (c) 2015 Herasymenko Yevhen. All rights reserved.
//

#import "HYVBasicGetRequest.h"

@interface HYVGoogleSearchRequest : HYVBasicGetRequest

- (instancetype)initWithSearch:(NSString *)searchString success:(SuccessCompletion)succesBlock error:(ErrorCompletion)errorBlock;

@end
