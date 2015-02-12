//
//  HYVBasicRequestWithImage.h
//  Pods
//
//  Created by Herasymenko Yevhen on 12.02.15.
//
//

#import "HYVBasicRequest.h"

@interface HYVBasicRequestWithImage : HYVBasicRequest

@property (strong, nonatomic) NSString *objectParamKey;

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *name;

- (void)updateWithImage:(UIImage *)image withName:(NSString *)name;

@end
