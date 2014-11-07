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

- (NSString *(^)(NSString *, ...))addFormat {
    NSString * (^ result)(NSString *, ...) = ^(NSString *format, ...) {
        va_list arglist;
        va_start(arglist, format);
        NSString *statement = [[NSString alloc] initWithFormat:format arguments:arglist];
        va_end(arglist);
        return self.add(statement);
    };
    
    return result;
}

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

- (BOOL (^)(NSString *))isContains {
    BOOL (^ result)(NSString *) = ^ BOOL(NSString *input){
        return self.indexOf(input) != NSNotFound;
    };
    return result;
}

- (NSString *(^)(NSString *, NSString *))replace {
    NSString * (^ result)(NSString *, NSString *) = ^(NSString *targetString, NSString *withString) {
        NSString *output = [self stringByReplacingOccurrencesOfString:targetString withString:withString];
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

- (BOOL (^)(NSString *))isEqualToIgnoreCase {
    NSString *originString = self.mutableCopy;
    
    BOOL (^ result)(NSString *) = ^BOOL (NSString *input) {
        return [originString compare:input options:NSCaseInsensitiveSearch] == NSOrderedSame;
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
        NSString *string = @"^(http|https|ftp)\\://([a-zA-Z0-9\\.\\-]+(\\:[a-zA-Z0-9\\.&amp;%\\$\\-]+)*@)?((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|([a-zA-Z0-9\\-]+\\.)*[a-zA-Z0-9\\-]+\\.[a-zA-Z]{2,4})(\\:[0-9]+)?(/[^/][a-zA-Z0-9\\.\\,\?\'\\/\\+&amp;%\\$#\\=~_\\-@]*)*$";
        return originString.isMatch(string);
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

- (BOOL (^)())isNumber {
    BOOL (^result)() = ^() {
        BOOL isValid = NO;
        NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:self];
        isValid = [alphaNumbersSet isSupersetOfSet:stringSet];
        return isValid;
    };
    return result;
}

//- (BOOL (^)())isIntNumber {
//    
//}

- (BOOL (^)(NSString *))isMatch {
    NSString *originString = self.mutableCopy;
    
    BOOL (^ result)(NSString *) = ^(NSString *regexString) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
        return [predicate evaluateWithObject:originString];
    };
    return result;
}

- (NSString *(^)())strim {
    NSString * (^ result)() = ^() {
        return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    };
    
    return result;
}

- (NSString *(^)())urlEncode {
    NSString * (^ result)() = ^() {
        return [self _urlEncode];
    };
    
    return result;
}

- (NSString *(^)())urlDecode {
    NSString * (^ result)() = ^() {
        return [self _urlDecode];
    };
    
    return result;
}

#pragma mark - helper
- (NSString *)_urlEncode {
    return [self urlEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)_urlDecode {
    return [self urlDecodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

@end
