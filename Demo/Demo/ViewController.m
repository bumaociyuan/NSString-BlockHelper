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
    NSString *bumaociyuan = @"bumaociyuan";
    bumaociyuan = bumaociyuan.add(@" is a boy");
    NSLog(@"%@",bumaociyuan);
    
    NSInteger loc = bumaociyuan.indexOf(@"bumaociyuan");
    NSLog(@"%d",loc);
    
    bumaociyuan = bumaociyuan.replace(@"boy",@"man");
    NSLog(@"%@",bumaociyuan);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
