//
//  HYVRequest.h
//  Pods
//
//  Created by Gerasymenko Yevgen on 19.01.15.
//
//

#import <Foundation/Foundation.h>

@protocol HYVRequest <NSObject>

@property (nonatomic,readwrite) BOOL executing;

@property (nonatomic, readonly) NSDictionary *parameters;
@property (nonatomic, readonly) NSString *path;
@property (nonatomic, readonly) NSString *succesObjectClass;
@property (nonatomic, readonly) NSString *errorObjectClass;

- (void)execute;

@end
