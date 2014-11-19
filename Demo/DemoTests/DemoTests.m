//
//  DemoTests.m
//  DemoTests
//
//  Created by zx on 8/23/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+BlockHelper.h"

@interface DemoTests : XCTestCase

@end

@implementation DemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSString *github = @"http://bumaociyuan.github.io";
    
    XCTAssert(github.isURL());
    
    NSString *email = @"zx19880528@gmail.com";
    XCTAssert(email.isEmail());
    
    NSString *phoneNumber = @"15288888888";
    XCTAssert(phoneNumber.isCellPhoneNumber());
    
    NSString *a = @"I'm";
    XCTAssert(a.addFormat(@" a %@",@"boy").isEqualTo(@"I'm a boy"));
    XCTAssert(a.isContains(@"'m"));
    XCTAssert(a.addFormat(@" %d years old",26).isEqualTo(@"I'm 26 years old"));
    
    NSString *urlEncoded = @"https%3A%2F%2Fgithub.com%2Fbumaociyuan%2FNSString-BlockHelper";
    NSString *urlDecoded = @"https://github.com/bumaociyuan/NSString-BlockHelper";
    XCTAssert(urlEncoded.urlDecode().isEqualTo(urlDecoded));
    XCTAssert(urlDecoded.urlEncode().isEqualTo(urlEncoded));
    
    
    NSString *uppercaseString = @"UPPERCASESTRING";
    NSString *lowercaseString = @"uppercaseString";
    XCTAssert(uppercaseString.isEqualToIgnoreCase(lowercaseString));
    

    NSString *intNumber = @"122";
    XCTAssert(intNumber.isNumber());
    XCTAssert(intNumber.isIntegerNumber());
    
    NSString *floatNumber = @"12.000321";
    XCTAssert(floatNumber.isDecimalNumber());
    
    
    NSString *fullUrl = @"https://github.com/bumaociyuan/NSString-BlockHelper?__iosbrowser&id=1544&other_id=74010&is_user=true";
    NSLog(@"%@",fullUrl.paramsInUrl());
    
    XCTAssert(fullUrl.paramInUrlWithKey(@"id").isEqualTo(@"1544"));
    

    XCTAssert(fullUrl.base64EncodedString().isEqualTo(@"aHR0cHM6Ly9naXRodWIuY29tL2J1bWFvY2l5dWFuL05TU3RyaW5nLUJsb2NrSGVscGVyP19faW9zYnJvd3NlciZpZD0xNTQ0Jm90aGVyX2lkPTc0MDEwJmlzX3VzZXI9dHJ1ZQ=="));
}

@end
