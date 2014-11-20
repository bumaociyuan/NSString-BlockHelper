NSString-BlockHelper
====================

NSString+BlockHelper

example

	    NSString *word1 = @"word1";
	    NSString *word2 = @"word2";
	    
	    NSString *word3 = word1.add(@" ").add(word2);
	    NSLog(@"%@",word3);
	    //output : word1 word2
	    
	    NSInteger loc = word3.indexOf(word2);
	    NSLog(@"%d",loc);
	    //output : 6
	    
	    NSString *word4 = @"word4";
	    NSString *word5 = @"word5";
		NSLog(@"%@",word3.replace(word1,word4).replace(word2,word5));
	    //output : word4 word5
	    
		BOOL isEqual = word4.isEqualTo(word5);
    	NSLog(@"%d",isEqual);

more examples in `DemoTests.m`
	
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
		//    get base64 encode string on https://www.base64decode.org/
	    //aHR0cHM6Ly9naXRodWIuY29tL2J1bWFvY2l5dWFuL05TU3RyaW5nLUJsb2NrSGVscGVyP19faW9zYnJvd3NlciZpZD0xNTQ0Jm90aGVyX2lkPTc0MDEwJmlzX3VzZXI9dHJ1ZQ==
	    NSLog(@"%@",fullUrl.paramsInUrl());
	    
	    XCTAssert(fullUrl.paramInUrlWithKey(@"id").isEqualTo(@"1544"));
	    
		XCTAssert(fullUrl.base64EncodedString().isEqualTo(@"aHR0cHM6Ly9naXRodWIuY29tL2J1bWFvY2l5dWFuL05TU3RyaW5nLUJsb2NrSGVscGVyP19faW9zYnJvd3NlciZpZD0xNTQ0Jm90aGVyX2lkPTc0MDEwJmlzX3VzZXI9dHJ1ZQ=="));

**fork and pull request is welcome**

####TODO
* Add more features
* ~~Add append int and float type feature~~
* ~~Cocoapods support~~
