//
//  ViewController.m
//  Demo
//
//  Created by zx on 8/23/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ViewController.h"
#import "NSString+BlockHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    
    NSString *word6 = word1.addInt(3223);
    NSLog(@"%@",word6);
    //output : word13223
}


@end
