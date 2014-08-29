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
	    
**fork and pull request is welcome**

####TODO
* Add more features
* ~~Add append int and float type feature~~
* Cocoapods support
