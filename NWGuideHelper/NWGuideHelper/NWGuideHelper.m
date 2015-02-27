//
//  NWGuideHelper.m
//  NWGuideHelper
//
//  Created by nate on 29/1/15.
//  Copyright (c) 2015年 nate. All rights reserved.
//

#import "NWGuideHelper.h"

#define MainScreenBounds   [UIScreen mainScreen].bounds


@interface NWGuideHelper()
@property (nonatomic, strong) NSString *identifierString;
@property (nonatomic, strong) UIButton *button;

@end

@implementation NWGuideHelper

#pragma  mark - init

+ (NWGuideHelper *)sharedInstance
{
    static NWGuideHelper *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NWGuideHelper alloc] init];
    });
    return sharedInstance;
}

- (void)showWithWithImage:(UIImage *)image identifierString:(NSString *)identifierString pressedHandler:(PressedHandler)handler
{
    self.identifierString = identifierString;
    BOOL shouldShow = ![[NSUserDefaults standardUserDefaults] boolForKey:identifierString];
    
    if (shouldShow) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(MainScreenBounds), CGRectGetHeight(MainScreenBounds))];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(guideButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [[self mainWindow] addSubview:button];
        self.button = button;
        self.pressedHandler = handler;
    }
}

- (void)guideButtonPressed:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:self.identifierString];
    UIButton *button = (UIButton *)sender;
    button.hidden = YES;
    [button removeFromSuperview];
    if (self.pressedHandler) {
        self.pressedHandler();
    }
}

- (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}

#pragma mark - reset
- (void)resetTheIdentifier:(NSString *)identifierString
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:identifierString];
}

@end
