//
//  NSString+zxHelper.h
//  NSStringHelper
//
//  Created by zx on 8/23/14.
//  Copyright (c) 2014 zxstudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BlockHelper)

/**
 *  @return self+inputString
 */
@property (nonatomic, readonly) NSString *(^add)(NSString *string);

/**
 *  @return indexOf inputString
 */
@property (nonatomic, readonly) NSInteger (^indexOf)(NSString *string);

/**
 *  @return relace 1st param in self with 2nd param
 */
@property (nonatomic, readonly) NSString *(^replace)(NSString *targetString,NSString *withString);

/**
 *  @return isEqualTo inputString
 */
@property (nonatomic, readonly) BOOL (^isEqualTo)(NSString *string);

@end
