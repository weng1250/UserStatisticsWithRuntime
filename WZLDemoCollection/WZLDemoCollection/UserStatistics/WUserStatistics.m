//
//  WUserStatistics.m
//  Demo
//
//  Created by wzl on 15-8-9.
//  Copyright (c) 2015年 Weng Zilin. All rights reserved.
//

#import "WUserStatistics.h"

@implementation WUserStatistics

/**
 *  初始化配置，一般在launchWithOption中调用
 */
+ (void)configure
{

}

#pragma mark -- 页面统计部分

+ (void)enterPageViewWithPageID:(NSString *)pageID
{
    //进入页面
    NSLog(@"***模拟发送[进入页面]事件给服务端，页面ID:%@", pageID);
}

+ (void)leavePageViewWithPageID:(NSString *)pageID
{
    //离开页面
    NSLog(@"***模拟发送[离开页面]事件给服务端，页面ID:%@", pageID);
}


#pragma mark -- 自定义事件统计部分


+ (void)sendEventToServer:(NSString *)eventId
{
    //在这里发送event统计信息给服务端
    NSLog(@"***模拟发送统计事件给服务端，事件ID: %@", eventId);
}

@end
