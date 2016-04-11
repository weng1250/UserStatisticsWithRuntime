//
//  WUserStatistics.h
//  Demo
//
//  Created by wzl on 15-8-9.
//  Copyright (c) 2015年 Weng Zilin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUserStatistics : NSObject

/**
 *  初始化配置，一般在launchWithOption中调用
 */
+ (void)configure;

+ (void)enterPageViewWithPageID:(NSString *)pageID;

+ (void)leavePageViewWithPageID:(NSString *)pageID;

+ (void)sendEventToServer:(NSString *)eventId;

@end
