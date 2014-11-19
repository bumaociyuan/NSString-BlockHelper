//
//  NSString+BlockHelper.h
//  NSString+BlockHelper
//
//  Created by zx on 8/23/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BlockHelper)

/*!
 *  @brief return self+inputString
 */
@property (nonatomic, readonly) NSString *(^add)();

@property (nonatomic, readonly) NSString *(^addFormat)(NSString *format, ...);

/*!
 *  @brief  return self+inputInt.stringValue
 */
@property (nonatomic, readonly) NSString *(^addInt)(NSInteger input);

/*!
 *  @brief  return self+inputFloat.stringValue
 */
@property (nonatomic, readonly) NSString *(^addFloat)(CGFloat input);

/*!
 *  @brief return indexOf inputString
 */
@property (nonatomic, readonly) NSInteger (^indexOf)(NSString *string);

@property (nonatomic, readonly) BOOL (^isContains)(NSString *string);

/*!
 *  @brief return relace 1st param in self with 2nd param
 */
@property (nonatomic, readonly) NSString *(^replace)(NSString *targetString,NSString *withString);

/*!
 *  @brief return isEqualTo inputString
 */
@property (nonatomic, readonly) BOOL (^isEqualTo)(NSString *string);

@property (nonatomic, readonly) BOOL (^isEqualToIgnoreCase)(NSString *string);

////////////////////update 2014.11.05/////////////////////////////////////////////////////////////

@property (nonatomic, readonly) BOOL (^isEmail)();
@property (nonatomic, readonly) BOOL (^isURL)();
@property (nonatomic, readonly) BOOL (^isCellPhoneNumber)();
@property (nonatomic, readonly) BOOL (^isNumber)();
@property (nonatomic, readonly) BOOL (^isIntegerNumber)();
@property (nonatomic, readonly) BOOL (^isDecimalNumber)();
/*!
 *  @brief return self is matching regexString
 */
@property (nonatomic, readonly) BOOL (^isMatch)(NSString *regexString);

@property (nonatomic, readonly) NSString *(^strim)();

@property (nonatomic, readonly) NSString *(^urlEncode)();

@property (nonatomic, readonly) NSString *(^urlDecode)();

////////////////////update 2014.11.19/////////////////////////////////////////////////////////////

@property (nonatomic, readonly) NSDictionary *(^paramsInUrl)();
@property (nonatomic, readonly) NSString *(^paramInUrlWithKey)(NSString *key);

@property (nonatomic, readonly) NSString *(^base64EncodedString)();
@property (nonatomic, readonly) NSString *(^base64DecodedString)();
@property (nonatomic, readonly) NSData *(^base64DecodedData)();
@end
