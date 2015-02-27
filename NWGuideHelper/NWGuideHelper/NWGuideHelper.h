//
//  NWGuideHelper.h
//  NWGuideHelper
//
//  Created by nate on 29/1/15.
//  Copyright (c) 2015年 nate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^PressedHandler)();

@interface NWGuideHelper : NSObject

@property (nonatomic, assign) PressedHandler pressedHandler;

+ (NWGuideHelper *)sharedInstance;
/**
 *  show the guide
 *
 *  @param image            image for the main view
 *  @param identifierString the gudie identifier
 *  @param handler          touch and remove the guide success
 */
- (void)showWithWithImage:(UIImage *)image identifierString:(NSString *)identifierString pressedHandler:(PressedHandler)handler;

/**
 *  reset your guide identifier, show it again
 *
 *  @param identifierString identifier
 */

- (void)resetTheIdentifier:(NSString *)identifierString;

@end