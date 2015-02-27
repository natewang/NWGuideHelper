//
//  ViewController.m
//  NWGuideHelper
//
//  Created by nate on 29/1/15.
//  Copyright (c) 2015年 nate. All rights reserved.
//

#import "ViewController.h"
#import "NWGuideHelper.h"
@interface ViewController ()

@property (nonatomic, strong) NWGuideHelper *helper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
}

- (void)viewDidAppear:(BOOL)animated
{
    [[NWGuideHelper sharedInstance] showWithWithImage:[UIImage imageNamed:@"wenzi"] identifierString:@"first show4"  pressedHandler:^{
        
        NSLog(@"pressed me");
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
