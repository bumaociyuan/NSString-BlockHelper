//
//  NSString+BlockHelper.m
//  NSString+BlockHelper
//
//  Created by zx on 8/23/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "NSString+BlockHelper.h"

@interface NSString (Base64)

+ (NSString *)_stringWithBase64EncodedString:(NSString *)string;
- (NSString *)_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)_base64EncodedString;
- (NSString *)_base64DecodedString;
- (NSData *)_base64DecodedData;

@end
@interface NSData (Base64)

+ (NSData *)_dataWithBase64EncodedString:(NSString *)string;
- (NSString *)_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)_base64EncodedString;

@end
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
    BOOL (^ result)(NSString *) = ^BOOL (NSString *input) {
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
    BOOL (^ result)() = ^() {
        BOOL isValid = NO;
        NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:self];
        isValid = [alphaNumbersSet isSupersetOfSet:stringSet];
        return isValid;
    };
    return result;
}

- (BOOL (^)())isIntegerNumber {
    BOOL (^result)() = ^() {
        return self.isMatch(@"[1-9][0-9]+");
    };
    return result;
}

- (BOOL (^)())isDecimalNumber {
    BOOL (^result)() = ^ () {
        BOOL output = NO;
        NSArray *splits = [self componentsSeparatedByString:@"."];
        if (splits.count == 2) {
            NSString *integer = splits[0];
            NSString *decimals = splits[1];
            output = integer.isIntegerNumber() && decimals.isNumber();
        }else if (splits.count == 1) {
            output = self.isIntegerNumber();
        }
        return output;
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

- (NSDictionary *(^)())paramsInUrl {
    NSDictionary * (^ result)() = ^() {
        NSMutableDictionary *output = [NSMutableDictionary new];
        NSArray *params = [self componentsSeparatedByString:@"?"];
        
        if (params.count > 1) {
            NSString *paramsString = params[1];
            NSArray *components = [paramsString componentsSeparatedByString:@"&"];
            
            for (NSString *component in components) {
                NSInteger index = component.indexOf(@"=");
                if (index != NSNotFound) {
                    output[[component substringToIndex:index]] = [component substringFromIndex:index+1];
                }else {
                    output[component] = @"";
                }
            }
        }
        
        return output;
    };
    
    return result;
}

- (NSString *(^)(NSString *))paramInUrlWithKey {
    NSString * (^ result)(NSString *) = ^(NSString *key) {
        return self.paramsInUrl()[key];
    };
    
    return result;
}

- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *(^)())base64EncodedString {
    NSString *(^result)() = ^ (){
        NSString *output = [self _base64EncodedString];
        return output;
    };
    return result;
}

- (NSString *(^)())base64DecodedString {
    NSString *(^result)() = ^ (){
        NSString *output = [self _base64DecodedString];
        return output;
    };
    return result;
}

- (NSData *(^)())base64DecodedData {
    NSData *(^result)() = ^ (){
        NSData *output = [self _base64DecodedData];
        return output;
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

@end

@implementation NSData (Base64)

+ (NSData *)_dataWithBase64EncodedString:(NSString *)string
{
    if (![string length]) return nil;
    
    NSData *decoded = nil;
    
#if __MAC_OS_X_VERSION_MIN_REQUIRED < __MAC_10_9 || __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    
    if (![NSData instancesRespondToSelector:@selector(initWithBase64EncodedString:options:)])
    {
        decoded = [[self alloc] initWithBase64Encoding:[string stringByReplacingOccurrencesOfString:@"[^A-Za-z0-9+/=]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [string length])]];
    }
    else
    
#endif
    
    {
        decoded = [[self alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    }
    
    return [decoded length]? decoded: nil;
}

- (NSString *)_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    if (![self length]) return nil;
    
    NSString *encoded = nil;
    
#if __MAC_OS_X_VERSION_MIN_REQUIRED < __MAC_10_9 || __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    
    if (![NSData instancesRespondToSelector:@selector(base64EncodedStringWithOptions:)])
    {
        encoded = [self base64Encoding];
    }
    else
    
#endif
    
    {
        switch (wrapWidth)
        {
            case 64:
            {
                return [self base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            }
            case 76:
            {
                return [self base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
            }
            default:
            {
                encoded = [self base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)0];
            }
        }
    }
    
    if (!wrapWidth || wrapWidth >= [encoded length])
    {
        return encoded;
    }
    
    wrapWidth = (wrapWidth / 4) * 4;
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < [encoded length]; i+= wrapWidth)
    {
        if (i + wrapWidth >= [encoded length])
        {
            [result appendString:[encoded substringFromIndex:i]];
            break;
        }
        [result appendString:[encoded substringWithRange:NSMakeRange(i, wrapWidth)]];
        [result appendString:@"\r\n"];
    }
    
    return result;
}

- (NSString *)_base64EncodedString
{
    return [self _base64EncodedStringWithWrapWidth:0];
}

@end


@implementation NSString (Base64)

+ (NSString *)_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData _dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data _base64EncodedStringWithWrapWidth:wrapWidth];
}

- (NSString *)_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data _base64EncodedString];
}

- (NSString *)_base64DecodedString
{
    return [NSString _stringWithBase64EncodedString:self];
}

- (NSData *)_base64DecodedData
{
    return [NSData _dataWithBase64EncodedString:self];
}

@end
