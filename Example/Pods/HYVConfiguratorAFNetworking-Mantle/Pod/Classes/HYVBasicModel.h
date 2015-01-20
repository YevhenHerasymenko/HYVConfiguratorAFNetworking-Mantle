//
//  HYVBasicModel.h
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface HYVBasicModel : MTLModel<MTLJSONSerializing>

@property (copy, nonatomic) NSString *message;
@property (strong, nonatomic) NSNumber *objectId;

@end
