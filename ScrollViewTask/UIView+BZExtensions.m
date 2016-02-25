//
//  UIView+BZExtensions.m
//  ScrollViewTask
//
//  Created by BZ on 2/15/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import "UIView+BZExtensions.h"

#import <objc/runtime.h>

typedef enum : NSUInteger
{
    BZViewSeparatorTypeNone = 1,
    BZViewSeparatorTypeTop = 2,
    BZViewSeparatorTypeBottom = 3,
    BZViewSeparatorTypeLeft = 4,
    BZViewSeparatorTypeRight = 5,
    BZViewSeparatorTypeEnumCount = BZViewSeparatorTypeRight
} BZViewSeparatorType;

@interface UIView (BZExtensions_private)

@property (nonatomic, assign) BZViewSeparatorType theBZViewSeparatorType;

@end

@implementation UIView (BZExtensions_private)

#pragma mark - Class Methods (Public)

#pragma mark - Class Methods (Private)

#pragma mark - Init & Dealloc

#pragma mark - Setters (Public)

- (void)setTheBZViewSeparatorType:(BZViewSeparatorType)theBZViewSeparatorType
{
    if (theBZViewSeparatorType > BZViewSeparatorTypeEnumCount)
    {
        abort();
    }
    if (self.theBZViewSeparatorType == theBZViewSeparatorType)
    {
        return;
    }
    objc_setAssociatedObject(self, @selector(theBZViewSeparatorType), @(theBZViewSeparatorType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - Getters (Public)

- (BZViewSeparatorType)theBZViewSeparatorType
{
    NSNumber *theNumber = objc_getAssociatedObject(self, @selector(theBZViewSeparatorType));
    if (!theNumber)
    {
        objc_setAssociatedObject(self, @selector(theBZViewSeparatorType), @(BZViewSeparatorTypeNone), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        theNumber = @(BZViewSeparatorTypeNone);
    }
    return theNumber.unsignedIntegerValue;
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
    
    [self methodAdjustTheSeparatorsViewArrayWithNewWidth:theWidth];

    CGRect theFrameRect = self.frame;
    theFrameRect.size.width = theWidth;
    self.frame = theFrameRect;
    
    switch (self.theBZViewSeparatorType)
    {
        case BZViewSeparatorTypeNone:
        {
            
        }
            break;
        case BZViewSeparatorTypeBottom:
        {
            if (self.superview.theBottomSeparatorView != self)
            {
                self.theBZViewSeparatorType = BZViewSeparatorTypeNone;
                break;
            }
            self.theCenterX = self.superview.theWidth/2;
        }
            break;
        case BZViewSeparatorTypeTop:
        {
            if (self.superview.theTopSeparatorView != self)
            {
                self.theBZViewSeparatorType = BZViewSeparatorTypeNone;
                break;
            }
            self.theCenterX = self.superview.theWidth/2;
        }
            break;
        case BZViewSeparatorTypeLeft:
        {
            if (self.superview.theLeftSeparatorView != self)
            {
                self.theBZViewSeparatorType = BZViewSeparatorTypeNone;
                break;
            }
        }
            break;
        case BZViewSeparatorTypeRight:
        {
            if (self.superview.theRightSeparatorView != self)
            {
                self.theBZViewSeparatorType = BZViewSeparatorTypeNone;
                break;
            }
            self.theMaxX = self.superview.theWidth;
        }
            break;
    }
}

- (void)setTheHeight:(double)theHeight
{
    if (theHeight < 0)
    {
        abort();
    }
    
    [self methodAdjustTheSeparatorsViewArrayWithNewHeight:theHeight];
    
    CGRect theFrameRect = self.frame;
    theFrameRect.size.height = theHeight;
    self.frame = theFrameRect;
    
    switch (self.theBZViewSeparatorType)
    {
        case BZViewSeparatorTypeNone:
        {
            
        }
            break;
        case BZViewSeparatorTypeBottom:
        {
            if (self.superview.theBottomSeparatorView != self)
            {
                self.theBZViewSeparatorType = BZViewSeparatorTypeNone;
                break;
            }
            self.theMaxY = self.superview.theHeight;
        }
            break;
        case BZViewSeparatorTypeTop:
        {
            if (self.superview.theTopSeparatorView != self)
            {
                self.theBZViewSeparatorType = BZViewSeparatorTypeNone;
                break;
            }
        }
            break;
        case BZViewSeparatorTypeLeft:
        {
            if (self.superview.theLeftSeparatorView != self)
            {
                self.theBZViewSeparatorType = BZViewSeparatorTypeNone;
                break;
            }
            self.theCenterY = self.superview.theHeight/2;
        }
            break;
        case BZViewSeparatorTypeRight:
        {
            if (self.superview.theRightSeparatorView != self)
            {
                self.theBZViewSeparatorType = BZViewSeparatorTypeNone;
                break;
            }
            self.theCenterY = self.superview.theHeight/2;
        }
            break;
    }
}

#pragma mark - Getters (Public)

- (UIView * _Nonnull)theBottomSeparatorView
{
    UIView *theView = objc_getAssociatedObject(self, @selector(theBottomSeparatorView));
    if (!theView)
    {
        UIView *theBottomSeparatorView = [UIView new];
        theView = theBottomSeparatorView;
        [self addSubview:theView];
        objc_setAssociatedObject(self, @selector(theBottomSeparatorView), theView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        theView.theHeight = 1;
        theView.theWidth = theView.superview.theWidth;
        theView.theMaxY = theView.superview.theHeight;
        
        theView.theBZViewSeparatorType = BZViewSeparatorTypeBottom;
    }
    return theView;
}

- (UIView * _Nonnull)theTopSeparatorView
{
    UIView *theView = objc_getAssociatedObject(self, @selector(theTopSeparatorView));
    if (!theView)
    {
        UIView *theTopSeparatorView = [UIView new];
        theView = theTopSeparatorView;
        [self addSubview:theView];
        objc_setAssociatedObject(self, @selector(theTopSeparatorView), theView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        theView.theHeight = 1;
        theView.theWidth = theView.superview.theWidth;
        theView.theBZViewSeparatorType = BZViewSeparatorTypeTop;
    }
    return theView;
}

- (UIView * _Nonnull)theLeftSeparatorView
{
    UIView *theView = objc_getAssociatedObject(self, @selector(theLeftSeparatorView));
    if (!theView)
    {
        UIView *theLeftSeparatorView = [UIView new];
        theView = theLeftSeparatorView;
        [self addSubview:theView];
        objc_setAssociatedObject(self, @selector(theLeftSeparatorView), theView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        theView.theHeight = theView.superview.theHeight;
        theView.theWidth = 1;
        theView.theBZViewSeparatorType = BZViewSeparatorTypeLeft;
    }
    return theView;
}

- (UIView * _Nonnull)theRightSeparatorView
{
    UIView *theView = objc_getAssociatedObject(self, @selector(theRightSeparatorView));
    if (!theView)
    {
        UIView *theRightSeparatorView = [UIView new];
        theView = theRightSeparatorView;
        [self addSubview:theView];
        objc_setAssociatedObject(self, @selector(theRightSeparatorView), theView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        theView.theHeight = theView.superview.theHeight;
        theView.theWidth = 1;
        theView.theBZViewSeparatorType = BZViewSeparatorTypeRight;
        theView.theMaxY = theView.superview.theMaxY;
    }
    return theView;
}


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

- (NSArray * _Nonnull)getTheSeparatorsArray
{
    NSMutableArray *theMutableArray = [NSMutableArray new];
    UIView *theBottomSeparatorView = objc_getAssociatedObject(self, @selector(theBottomSeparatorView));
    if (theBottomSeparatorView)
    {
        [theMutableArray addObject:theBottomSeparatorView];
    }
    
    UIView *theTopSeparatorView = objc_getAssociatedObject(self, @selector(theTopSeparatorView));
    if (theTopSeparatorView)
    {
        [theMutableArray addObject:theTopSeparatorView];
    }

    UIView *theLeftSeparatorView = objc_getAssociatedObject(self, @selector(theLeftSeparatorView));
    if (theLeftSeparatorView)
    {
        [theMutableArray addObject:theLeftSeparatorView];
    }
    
    UIView *theRightSeparatorView = objc_getAssociatedObject(self, @selector(theRightSeparatorView));
    if (theRightSeparatorView)
    {
        [theMutableArray addObject:theRightSeparatorView];
    }

    return theMutableArray.copy;
}

#pragma mark - Methods (Private)

- (void)methodAdjustTheSeparatorsViewArrayWithNewWidth:(double)theNewWidth
{
    if (theNewWidth < 0)
    {
        abort();
    }
    NSArray *theSeparatorsViewArray = [self getTheSeparatorsArray];
    if (theSeparatorsViewArray.count == 0)
    {
        return;
    }

    for (UIView *theCurrentView in theSeparatorsViewArray)
    {
        
        switch (theCurrentView.theBZViewSeparatorType)
        {
            case BZViewSeparatorTypeNone:
            {
                
            }
                break;
            case BZViewSeparatorTypeBottom:
            {
//                theCurrentView.theWidth = theCurrentView.theWidth * theNewWidth/theCurrentView.superview.theWidth;
//                theCurrentView.theCenterX = theCurrentView.superview.theWidth/2;
                CGRect theFrameRect = theCurrentView.frame;
                theFrameRect.size.width = theCurrentView.frame.size.width * theNewWidth/theCurrentView.superview.frame.size.width;
                theCurrentView.frame = theFrameRect;
                theCurrentView.theCenterX = theNewWidth/2;
            }
                break;
            case BZViewSeparatorTypeTop:
            {
                CGRect theFrameRect = theCurrentView.frame;
                theFrameRect.size.width = theCurrentView.frame.size.width * theNewWidth/theCurrentView.superview.frame.size.width;
                theCurrentView.frame = theFrameRect;
                theCurrentView.theCenterX = theNewWidth/2;
            }
                break;
            case BZViewSeparatorTypeLeft:
            {
                
            }
                break;
            case BZViewSeparatorTypeRight:
            {
                theCurrentView.theMaxX = theNewWidth;
            }
                break;
        }
    }
}

- (void)methodAdjustTheSeparatorsViewArrayWithNewHeight:(double)theNewHeight
{
    if (theNewHeight < 0)
    {
        abort();
    }
    NSArray *theSeparatorsViewArray = [self getTheSeparatorsArray];
    if (theSeparatorsViewArray.count == 0)
    {
        return;
    }
    
    for (UIView *theCurrentView in theSeparatorsViewArray)
    {
        switch (theCurrentView.theBZViewSeparatorType)
        {
            case BZViewSeparatorTypeNone:
            {
                
            }
                break;
            case BZViewSeparatorTypeBottom:
            {
                theCurrentView.theMaxY = theCurrentView.superview.theHeight;
            }
                break;
            case BZViewSeparatorTypeTop:
            {
                
            }
                break;
            case BZViewSeparatorTypeLeft:
            {
                CGRect theFrameRect = theCurrentView.frame;
                theFrameRect.size.height = theCurrentView.frame.size.height * theNewHeight/theCurrentView.superview.frame.size.height;
                theCurrentView.frame = theFrameRect;
                theCurrentView.theCenterY = theNewHeight/2;
            }
                break;
            case BZViewSeparatorTypeRight:
            {
                CGRect theFrameRect = theCurrentView.frame;
                theFrameRect.size.height = theCurrentView.frame.size.height * theNewHeight/theCurrentView.superview.frame.size.height;
                theCurrentView.frame = theFrameRect;
                theCurrentView.theCenterY = theNewHeight/2;
            }
                break;
        }
    }
}

#pragma mark - Standard Methods

@end






























