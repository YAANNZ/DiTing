//
//  DiTingTests.m
//  DiTingTests
//
//  Created by ZHUYN on 2017/2/6.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DiTingTests : XCTestCase

@end

@implementation DiTingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testOnePlusOne {
    NSInteger a = 1;
    NSInteger b = 1;
    NSInteger result = a + b;
    XCTAssertTrue(result == 2);
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

@end
