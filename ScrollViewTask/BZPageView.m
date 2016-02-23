//
//  BZPageView.m
//  ScrollViewTask
//
//  Created by BZ on 2/18/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import "BZPageView.h"

#import "BZExtensionsManager.h"

@interface BZPageView ()

@property (nonatomic, strong, nonnull) NSMutableArray<UIView *> *theViewsArray;
@property (nonatomic, strong, nonnull) UIView *theHolderView;
@property (nonatomic, assign) BOOL theIsMoving;
@property (nonatomic, assign) double theStartMovingCenterX;
@property (nonatomic, assign) double theStartMovingCenterY;
@property (nonatomic, assign, readwrite) double theCurrentPageIndex;

@end

@implementation BZPageView

#pragma mark - Class Methods (Public)

#pragma mark - Class Methods (Private)

#pragma mark - Init & Dealloc

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self methodInitBZPageView];
    }
    return self;
}

- (void)methodInitBZPageView
{
    self.clipsToBounds = YES;
    _theViewsArray = [NSMutableArray new];
    _theViewPagingOrientation = BZPageViewOrientationVertical;
    
    UIView *theHolderView = [UIView new];
    _theHolderView = theHolderView;
    [self addSubview:theHolderView];
    theHolderView.clipsToBounds = YES;
    theHolderView.backgroundColor = [UIColor blueColor];
    
    _theAnimationDuration = 1.4;
    _theSpringDamping = 0.2;
    _theAnimationOptions = UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction;
    
    UIPanGestureRecognizer *thePanGestureRecognizer = [UIPanGestureRecognizer new];
    [thePanGestureRecognizer addTarget:self action:@selector(handleHolderViewPanGestureRecognizer:)];
    thePanGestureRecognizer.maximumNumberOfTouches = 1;
    [self addGestureRecognizer:thePanGestureRecognizer];
}

#pragma mark - Setters (Public)

- (void)setTheViewPagingOrientation:(BZPageViewOrientation)theViewPagingOrientation
{
    if (_theViewPagingOrientation == theViewPagingOrientation)
    {
        return;
    }
    _theViewPagingOrientation = theViewPagingOrientation;
    if (!theViewPagingOrientation || theViewPagingOrientation > BZPageViewOrientationEnumCount)
    {
        abort();
    }
    if (self.theViewsArray.count < 2)
    {
        return;
    }
    [self methodAdjustPageView];
}


- (void)setTheAnimationDuration:(double)theAnimationDuration
{
    if (theAnimationDuration < 0)
    {
        abort();
    }
    if (theAnimationDuration == _theAnimationDuration)
    {
        return;
    }
    _theAnimationDuration = theAnimationDuration;
}

- (void)setTheSpringDamping:(double)theSpringDamping
{
    if (theSpringDamping == _theSpringDamping)
    {
        return;
    }
    _theSpringDamping = theSpringDamping;
}

- (void)setTheAnimationOptions:(UIViewAnimationOptions)theAnimationOptions
{
    if (theAnimationOptions == _theAnimationOptions)
    {
        return;
    }
    _theAnimationOptions = theAnimationOptions;
}

#pragma mark - Getters (Public)

#pragma mark - Setters (Private)

#pragma mark - Getters (Private)

#pragma mark - Lifecycle

#pragma mark - Create Views & Variables

#pragma mark - Actions

#pragma mark - Gestures

- (void)handleHolderViewPanGestureRecognizer:(UIPanGestureRecognizer *)thePanGestureRecognizer
{
    if (self.theViewsArray.count == 0)
    {
        return;
    }
    CGPoint thePointInView =  [thePanGestureRecognizer translationInView:self];
    CGPoint theVelocityInView = [thePanGestureRecognizer velocityInView:self];
    UIGestureRecognizerState theState = thePanGestureRecognizer.state;
    if (theState == UIGestureRecognizerStateBegan)
    {
        self.theIsMoving = YES;
        self.theStartMovingCenterX = self.theHolderView.theCenterX;
        self.theStartMovingCenterY = self.theHolderView.theCenterY;
        return;
    }
    if (theState == UIGestureRecognizerStateChanged)
    {
        switch (self.theViewPagingOrientation)
        {
            case BZPageViewOrientationHorizontal:
            {
                self.theHolderView.theCenterX  =  (thePointInView.x + self.theStartMovingCenterX);
            }
                break;
                
            case BZPageViewOrientationVertical:
            {
                self.theHolderView.theCenterY = (thePointInView.y + self.theStartMovingCenterY);
            }
                break;
        }
        return;
    }
    self.theIsMoving = NO;
    
    [UIView animateWithDuration:self.theAnimationDuration
                          delay:0
         usingSpringWithDamping:self.theSpringDamping
          initialSpringVelocity:0
                        options:self.theAnimationOptions
                     animations:^
     {
         switch (self.theViewPagingOrientation)
         {
             case BZPageViewOrientationHorizontal:
             {
                 self.theHolderView.theCenterX += thePointInView.x * sqrt(fabs(theVelocityInView.x) / 2500);
             }
                 break;
                 
             case BZPageViewOrientationVertical:
             {
                 self.theHolderView.theCenterY += thePointInView.y * sqrt (fabs(theVelocityInView.y) / 2500);
             }
                 break;
         }
         double theViewCenterX = self.theWidth/2;
         double theViewCenterY  = self.theHeight/2;
         CGPoint theHolderViewPoint = [self convertPoint:CGPointMake(theViewCenterX, theViewCenterY)
                                                  toView:self.theHolderView];
         UIView *theView = [self.theHolderView hitTest:theHolderViewPoint withEvent:nil];
         switch (self.theViewPagingOrientation)
         {
             case BZPageViewOrientationHorizontal:
             {
                 if (!theView)
                 {
                     double theScrollInset = self.theHolderView.theCenterX - self.theStartMovingCenterX;
                     if (theScrollInset < 0)
                     {
                         self.theHolderView.theCenterX +=
                         (theHolderViewPoint.x - self.theViewsArray[self.theViewsArray.count - 1].theCenterX);
                         theView = self.theViewsArray[self.theViewsArray.count - 1];
                     }
                     else
                     {
                         self.theHolderView.theCenterX += (theHolderViewPoint.x - self.theViewsArray[0].theCenterX);
                         theView = self.theViewsArray[0];
                     }
                 }
                 else
                 {
                     self.theHolderView.theCenterX += (theHolderViewPoint.x - theView.theCenterX);
                 }
                 self.theCurrentPageIndex = [self getIndexForView:theView];
                 if (self.theDelegate)
                 {
                     [self.theDelegate pageView:self didScrollToView:theView atIndex:self.theCurrentPageIndex];
                 }
             }
                 break;
                 
             case BZPageViewOrientationVertical:
             {
                 if (!theView)
                 {
                     double theScrollInset = self.theHolderView.theCenterY - self.theStartMovingCenterY;
                     if (theScrollInset < 0)
                     {
                         self.theHolderView.theCenterY +=
                         (theHolderViewPoint.y - self.theViewsArray[self.theViewsArray.count - 1].theCenterY);
                         theView = self.theViewsArray[self.theViewsArray.count - 1];
                     }
                     else
                     {
                         self.theHolderView.theCenterY += (theHolderViewPoint.y - self.theViewsArray[0].theCenterY);
                         theView = self.theViewsArray[0];
                     }
                 }
                 else
                 {
                     self.theHolderView.theCenterY += (theHolderViewPoint.y - theView.theCenterY);
                 }
                 self.theCurrentPageIndex = [self getIndexForView:theView];
                 if (self.theDelegate)
                 {
                     [self.theDelegate pageView:self didScrollToView:theView atIndex:self.theCurrentPageIndex];
                 }
             }
                 break;
         }
     }
                     completion:nil];
}


#pragma mark - Delegates ()

#pragma mark - Methods (Public)

- (void)methodAddPage:(UIView * _Nonnull)thePage
{
    if (!thePage)
    {
        abort();
    }
    if ([self.theViewsArray containsObject:thePage])
    {
        return;
    }
    [self.theViewsArray addObject:thePage];
    [self.theHolderView addSubview:thePage];
    [self methodAdjustHolderView];
    if (self.theViewsArray.count == 1)
    {
        thePage.theCenterX = self.theWidth/2;
        thePage.theCenterY = self.theHeight/2;
    }
    else
    {
        UIView *theLastAddedView = self.theViewsArray[self.theViewsArray.count - 2];
        switch (self.theViewPagingOrientation)
        {
            case BZPageViewOrientationHorizontal:
            {
                thePage.theCenterY = theLastAddedView.theCenterY;
                thePage.theMinX =  theLastAddedView.theMaxX;
            }
                break;
            case BZPageViewOrientationVertical:
            {
                thePage.theCenterX =  theLastAddedView.theCenterX;
                thePage.theCenterY = theLastAddedView.theCenterY + theLastAddedView.theHeight/2 + thePage.theHeight/2;
            }
                break;
        }
    }
}

- (void)methodScrollToViewWithIndex:(NSInteger)theIndex
{
    if (theIndex < 0 || (self.theViewsArray.count - 1 < theIndex))
    {
        abort();
    }
    if (theIndex == self.theCurrentPageIndex)
    {
        return;
    }
    self.theCurrentPageIndex = theIndex;
    [UIView animateWithDuration:self.theAnimationDuration
                          delay:0
         usingSpringWithDamping:self.theSpringDamping
          initialSpringVelocity:0
                        options:self.theAnimationOptions
                     animations:^
     {
         double theViewCenterX = self.theWidth/2;
         double theViewCenterY  = self.theHeight/2;
         CGPoint theHolderViewPoint = [self convertPoint:CGPointMake(theViewCenterX, theViewCenterY)
                                                  toView:self.theHolderView];

         switch (self.theViewPagingOrientation)
         {
             case BZPageViewOrientationHorizontal:
             {
                 self.theHolderView.theCenterX +=
                 (theHolderViewPoint.x - self.theViewsArray[theIndex].theCenterX);
             }
                 break;
                 
             case BZPageViewOrientationVertical:
             {
                 self.theHolderView.theCenterY +=
                 (theHolderViewPoint.y - self.theViewsArray[theIndex].theCenterY);
             }
                 break;
         }
     }
                     completion:nil];
}

#pragma mark - Methods (Private)

- (void)methodAdjustHolderView
{
    if (self.theViewsArray.count == 0)
    {
          return;
    }
    switch (self.theViewPagingOrientation)
    {
        case BZPageViewOrientationHorizontal:
        {
            self.theHolderView.theHeight = self.theHeight;
            double theWidth = self.theWidth/2 - self.theViewsArray[0].theWidth / 2;
            for (int i = 0; i < self.theViewsArray.count; i++)
            {
                theWidth += self.theViewsArray[i].theWidth;
            }
            if (theWidth > self.theWidth)
            {
                self.theHolderView.theWidth = theWidth;
            }
        }
            break;
            
        case BZPageViewOrientationVertical:
        {
            self.theHolderView.theWidth = self.theWidth;
            double theHeight = self.theHeight/2 - self.theViewsArray[0].theHeight / 2;
            for (int i = 0; i < self.theViewsArray.count; i++)
            {
                theHeight += self.theViewsArray[i].theHeight;
            }
            if (theHeight > self.theHeight)
            {
                self.theHolderView.theHeight = theHeight;
            }
        }
            break;
    }
}

- (void)methodAdjustPageView
{
    self.theHolderView.theMinX = 0;
    self.theHolderView.theMinY = 0;
    NSArray *theSubviews = self.theViewsArray;
    for (UIView *theView in theSubviews)
    {
        [theView removeFromSuperview];
    }
    NSArray *theViewsArray = self.theViewsArray.copy;
    [self.theViewsArray removeAllObjects];
    for (int i = 0; i < theViewsArray.count; i++)
    {
        [self methodAddPage:theViewsArray[i]];
    }
}

- (NSInteger)getIndexForView:(UIView * _Nonnull)theView
{
    if (!theView)
    {
        abort();
    }
    if (self.theViewsArray.count == 0)
    {
        return -1;
    }
    for (int i = 0; i < self.theViewsArray.count; i++)
    {
        UIView *theCurrentView = self.theViewsArray[i];
        if (isEqual(theView, theCurrentView))
        {
            return i;
        }
    }
    return -1;
}

#pragma mark - Standard Methods

@end































