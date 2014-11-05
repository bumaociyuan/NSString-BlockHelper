//
//  NSString+zxHelper.m
//  NSStringHelper
//
//  Created by zx on 8/23/14.
//  Copyright (c) 2014 zxstudio. All rights reserved.
//

#import "NSString+BlockHelper.h"

@implementation NSString (BlockHelper)

- (NSString *(^)())add {
    NSString * (^ result)(NSString *) = ^(NSString *input) {
        NSString *output = nil;
        
        if ([input isKindOfClass:[NSString class]] || [input isKindOfClass:[NSNumber class]]) {
            output = [NSString stringWithFormat:@"%@%@", self, input];
        }
        
        return output;
    };
    
    return result;
}

//- (NSString *(^)())addFormat {
//
//    NSString *(^result)(NSString *) = ^(NSString *input){
//        NSString *output = nil;
//        if ([input isKindOfClass:[NSString class]] || [input isKindOfClass:[NSNumber class]]) {
//            output = [NSString stringWithFormat:@"%@%@",self,input];
//        }
//        return output;
//    };
//    return result;
//}

- (NSString *(^)(NSInteger))addInt {
    NSString * (^ result)(NSInteger) = ^(NSInteger input) {
        NSString *output = nil;
        output = [NSString stringWithFormat:@"%@%d", self, input];
        return output;
    };
    
    return result;
}

- (NSString *(^)(CGFloat))addFloat {
    NSString * (^ result)(CGFloat) = ^(CGFloat input) {
        NSString *output = nil;
        output = [NSString stringWithFormat:@"%@%f", self, input];
        return output;
    };
    
    return result;
}

- (NSInteger (^)(NSString *))indexOf {
    NSInteger (^ result)(NSString *) = ^(NSString *input) {
        NSInteger output = NSNotFound;
        output = [self rangeOfString:input].location;
        return output;
    };
    return result;
}

- (NSString *(^)(NSString *, NSString *))replace {
    NSString * (^ result)(NSString *, NSString *) = ^(NSString *targetString, NSString *withString) {
        NSMutableString *output = [NSMutableString stringWithString:self];
        [output replaceOccurrencesOfString:targetString withString:withString options:NSCaseInsensitiveSearch range:NSMakeRange(0, self.length)];
        return output;
    };
    
    return result;
}

- (BOOL (^)(NSString *))isEqualTo {
    NSString *originString = self.mutableCopy;
    
    BOOL (^ result)(NSString *) = ^(NSString *input) {
        return [originString isEqualToString:input];
    };
    return result;
}

- (BOOL (^)())isEmail {
    NSString *originString = self.mutableCopy;
    
    BOOL (^ result)() = ^() {
        return originString.isMatch(@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
    };
    return result;
}

- (BOOL (^)())isURL {
    NSString *originString = self.mutableCopy;
    
    BOOL (^ result)() = ^() {
        return originString.isMatch(@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+");
    };
    return result;
}

- (BOOL (^)())isCellPhoneNumber {
    NSString *originString = self.mutableCopy;
    
    BOOL (^ result)() = ^() {
        //TODO: add specific regex string
        return originString.isMatch(@"[1][0-9]{10}");
    };
    return result;
}

- (BOOL (^)(NSString *))isMatch {
    NSString *originString = self.mutableCopy;
    
    BOOL (^ result)(NSString *) = ^(NSString *regexString) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
        return [predicate evaluateWithObject:originString];
    };
    return result;
}

@end
