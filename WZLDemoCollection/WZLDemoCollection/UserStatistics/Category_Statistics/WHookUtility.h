//
//  WHookUtility.h
//  WZLDemoCollection
//
//  Created by wengzilin on 16/4/7.
//  Copyright © 2016年 wengzilin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHookUtility : NSObject

+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end
