//
//  EventIDMappingTests.m
//  WZLDemoCollection
//
//  Created by wengzilin on 16/4/6.
//  Copyright © 2016年 wengzilin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>

@interface EventIDMappingTests : XCTestCase

@end

@implementation EventIDMappingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

//测试page-action-eventID是否匹配
//能够及时发现函数名称被改变导致点击事件被runtime忽略的情况
- (void)testIfUserStatisticsConfigPlistValid
{
    NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
    XCTAssertNotNil(configDict, @"WGlobalUserStatisticsConfig.plist加载失败");
    
    [configDict enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        XCTAssert([obj isKindOfClass:[NSDictionary class]], @"plist文件结构可能已经改变，请确认");
        NSString *targetPageName = key;
        Class pageClass = NSClassFromString(targetPageName);
        id pageInstance = [[pageClass alloc] init];
        
        //一个pageDict对应一个页面，存放pageID,所有的action及对应的eventID
        NSDictionary *pageDict = (NSDictionary *)obj;
        
        //页面配置信息
        NSDictionary *pageEventIDDict = pageDict[@"PageEventIDs"];
        
        //交互配置信息
        NSDictionary *controlEventIDDict = pageDict[@"ControlEventIDs"];
        
        XCTAssert(pageEventIDDict, @"plist文件未包含PageID字段或者该字段值为空");
        XCTAssert(controlEventIDDict, @"plist文件未包含EventIDs字段或者该字段值为空");
        
        [pageEventIDDict enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
            XCTAssert([value isKindOfClass:[NSString class]], @"plist文件结构可能已经改变，请确认");
            XCTAssertNotNil(value, @"EVENT_ID为空，请确认");
        }];
        
        [controlEventIDDict enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
            XCTAssert([value isKindOfClass:[NSString class]], @"plist文件结构可能已经改变，请确认");
            NSString *actionName = key;
            SEL actionSel = NSSelectorFromString(actionName);
            XCTAssert([pageInstance respondsToSelector:actionSel], @"代码与plist文件函数不匹配，请确认：-[%@ %@]", targetPageName, actionName);
            
            //EVENT_ID不能为空
            XCTAssertNotNil(value, @"EVENT_ID为空，请确认");
        }];
    }];
    
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WGlobalUserStatisticsConfig" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

@end
