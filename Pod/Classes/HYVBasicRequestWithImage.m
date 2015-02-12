//
//  HYVBasicRequestWithImage.m
//  Pods
//
//  Created by Herasymenko Yevhen on 12.02.15.
//
//

#import "HYVBasicRequestWithImage.h"

@implementation HYVBasicRequestWithImage

- (void)updateWithImage:(UIImage *)image withName:(NSString *)name {
    self.image = image;
    self.name = name;
}

@end
