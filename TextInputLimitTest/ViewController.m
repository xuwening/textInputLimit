//
//  ViewController.m
//  TextInputLimitTest
//
//  Created by aqua on 14-9-2.
//  Copyright (c) 2014年 aqua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.textfield setValue:@4 forKey:@"limit"];
    [self.textview setValue:@6 forKey:@"limit"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
