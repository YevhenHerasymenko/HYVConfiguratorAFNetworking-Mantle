//
//  HYVBasicModel.h
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import <Mantle/MTLModel.h>
#import "MTLJSONAdapter.h"

@interface HYVBasicModel : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *objectId;

@end
