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

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textLimitLenght:) name:@"acceptLimitLength" object:nil];
}

-(void) textLimitLenght: (NSNotification *) notification {
    
    NSObject *object = notification.object;
    
    if ([object isEqual: self.textview]) {
        //收到来自textview的输入限制
    }
    
    if ([object isEqual: self.textfield]) {
        //收到来自textfield的输入限制
    }
    //提示
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"您输入的长度过长，自动被截断。" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
