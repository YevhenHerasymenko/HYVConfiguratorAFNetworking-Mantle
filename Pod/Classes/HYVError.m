//
//  HYVError.m
//  Pods
//
//  Created by Herasymenko Yevhen on 12.02.15.
//
//

#import "HYVError.h"
#import "NSDictionary+MTLManipulationAdditions.h"

@implementation HYVError

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:@{
                                                                                            @"message" : @"message"
                                                                                            }];
}

@end
