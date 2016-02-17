//
//  BZExtensionsManager.m
//  ScrollViewTask
//
//  Created by BZ on 2/15/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import "BZExtensionsManager.h"

@implementation BZExtensionsManager

BOOL isEqual(id _Nullable object1, id _Nullable object2)
{
    if (!object1 && !object2)
    {
        return YES;
    }
    return [object1 isEqual:object2];
}

#pragma mark - Class Methods (Public)

+ (void)methodDispatchAfterSeconds:(double)theSeconds
                         withBlock:(void (^ _Nonnull)())theBlock
{
    if (![NSThread isMainThread])
    {
        abort();
    }
    [self performSelector:@selector(selectorWithBlock:) withObject:theBlock afterDelay:theSeconds];
}

+ (void)methodAsyncMainWithBlock:(void (^ _Nonnull)())theBlock
{
    dispatch_async(dispatch_get_main_queue(), theBlock);
}

+ (void)methodAsyncBackgroundWithBlock:(void (^ _Nonnull)())theBlock
{
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),theBlock);
}

#pragma mark - Class Methods (Private)

#pragma mark - Init & Dealloc

#pragma mark - Setters (Public)

#pragma mark - Getters (Public)

#pragma mark - Setters (Private)

#pragma mark - Getters (Private)

#pragma mark - Lifecycle

#pragma mark - Create Views & Variables

#pragma mark - Actions

#pragma mark - Gestures

#pragma mark - Delegates ()

#pragma mark - Methods (Public)

#pragma mark - Methods (Private)

+ (void)selectorWithBlock:(void (^ _Nonnull)())theBlock
{
    theBlock();
}

#pragma mark - Standard Methods

@end






























