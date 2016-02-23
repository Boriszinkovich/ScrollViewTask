//
//  UIView+BZExtensions.m
//  ScrollViewTask
//
//  Created by BZ on 2/15/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import "UIView+BZExtensions.h"

#import <objc/runtime.h>

@implementation UIView (BZExtensions)

#pragma mark - Class Methods (Public)

#pragma mark - Class Methods (Private)

#pragma mark - Init & Dealloc

#pragma mark - Setters (Public)

- (void)setTheMinX:(double)theMinX
{
    CGRect theFrameRect = self.frame;
    theFrameRect.origin.x = theMinX;
    self.frame = theFrameRect;
}

- (void)setTheMinY:(double)theMinY
{
    CGRect theFrameRect = self.frame;
    theFrameRect.origin.y = theMinY;
    self.frame = theFrameRect;
}

- (void)setTheCenterX:(double)theCenterX
{
        CGRect theFrameRect = self.frame;
        theFrameRect.origin.x = theCenterX - theFrameRect.size.width / 2;
        self.frame = theFrameRect;
}

- (void)setTheCenterY:(double)theCenterY
{
    CGRect theFrameRect = self.frame;
    theFrameRect.origin.y = theCenterY - theFrameRect.size.height / 2;
    self.frame = theFrameRect;
}

- (void)setTheMaxX:(double)theMaxX
{
    CGRect theFrameRect = self.frame;
    theFrameRect.origin.x = theMaxX - theFrameRect.size.width;
    self.frame = theFrameRect;
}

- (void)setTheMaxY:(double)theMaxY
{
    CGRect theFrameRect = self.frame;
    theFrameRect.origin.y = theMaxY - theFrameRect.size.height;
    self.frame = theFrameRect;
}

- (void)setTheWidth:(double)theWidth
{
    if (theWidth < 0)
    {
        abort();
    }
    CGRect theFrameRect = self.frame;
    theFrameRect.size.width = theWidth;
    self.frame = theFrameRect;
}

- (void)setTheHeight:(double)theHeight
{
    if (theHeight < 0)
    {
        abort();
    }
    CGRect theFrameRect = self.frame;
    theFrameRect.size.height = theHeight;
    self.frame = theFrameRect;
}

#pragma mark - Getters (Public)

- (double)theMinX
{
    return self.frame.origin.x;
}

- (double)theMinY
{
    double theMinY = self.frame.origin.y;
    return theMinY;
}

- (double)theCenterX
{
    CGRect theFrameRect = self.frame;
    return theFrameRect.origin.x + theFrameRect.size.width / 2;
}

- (double)theCenterY
{
    CGRect theFrameRect = self.frame;
    return theFrameRect.origin.y + theFrameRect.size.height / 2;
}

- (double)theMaxX
{
    return self.frame.origin.x + self.frame.size.width;
}

- (double)theMaxY
{
    return self.frame.origin.y + self.frame.size.height;
}

- (double)theHeight
{
    return self.frame.size.height;
}

- (double)theWidth
{
    return self.frame.size.width;
}
#pragma mark - Setters (Private)

#pragma mark - Getters (Private)

#pragma mark - Lifecycle

#pragma mark - Create Views & Variables

#pragma mark - Actions

#pragma mark - Gestures

#pragma mark - Delegates ()

#pragma mark - Methods (Public)

#pragma mark - Methods (Private)

#pragma mark - Standard Methods

@end






























