//
//  BZExtensionsManager.h
//  ScrollViewTask
//
//  Created by BZ on 2/15/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "NSObject+BZExtensions.h"
#import "UIView+BZExtensions.h"
#import "UIColor+BZExtensions.h"
#import "UIImage+BZExtensions.h"
#import "NSArray+BZExtensions.h"
#import "NSDictionary+BZExtensions.h"

BOOL isEqual(id _Nullable object1 ,id _Nullable object2);

@interface BZExtensionsManager : NSObject

+ (void)methodAsyncMainWithBlock:(void (^ _Nonnull)())theBlock;
+ (void)methodAsyncBackgroundWithBlock:(void (^ _Nonnull)())theBlock;
+ (void)methodDispatchAfterSeconds:(double)theSeconds
                         withBlock:(void (^ _Nonnull)())theBlock;

@end






























