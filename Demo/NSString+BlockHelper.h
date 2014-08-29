//
//  NSString+zxHelper.h
//  NSStringHelper
//
//  Created by zx on 8/23/14.
//  Copyright (c) 2014 zxstudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BlockHelper)

/*!
 *  @brief return self+inputString
 */
@property (nonatomic, readonly) NSString *(^add)(NSString *string);

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

/*!
 *  @brief return relace 1st param in self with 2nd param
 */
@property (nonatomic, readonly) NSString *(^replace)(NSString *targetString,NSString *withString);

/*!
 *  @brief return isEqualTo inputString
 */
@property (nonatomic, readonly) BOOL (^isEqualTo)(NSString *string);

@end
