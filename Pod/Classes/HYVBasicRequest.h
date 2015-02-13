//
//  HYVBasicRequest.h
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import <Foundation/Foundation.h>
#import "HYVRequest.h"
#import "HYVConfiguratorAFNetworking.h"
#import "HYVBasicModel.h"

typedef void(^SuccessCompletion)(HYVBasicModel *response);
typedef void(^ErrorCompletion)(HYVBasicModel *response);

@interface HYVBasicRequest : NSObject <HYVRequest>

@property (copy, nonatomic) SuccessCompletion successBlock;
@property (copy, nonatomic) ErrorCompletion errorBlock;

@property (strong, nonatomic) AFHTTPRequestOperation *operation;

- (void)execute;
- (void)executeSuccess:(id)responseObject;
- (void)executeError:(NSError *)error;
- (void)updateSessionWithResponse:(NSURLResponse *)response;

@end
