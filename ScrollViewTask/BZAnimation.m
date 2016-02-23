//
//  BZAnimation.m
//  ScrollViewTask
//
//  Created by BZ on 2/23/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import "BZAnimation.h"

#import "BZExtensionsManager.h"

@interface BZAnimation ()

@property (nonatomic, copy) void (^ theMainAnimationBlock)(void);
@property (nonatomic, copy) void (^ theMainCompletionBlock)(BOOL isAnimationComplited);

@end

@implementation BZAnimation

#pragma mark - Class Methods (Public)

#pragma mark - Class Methods (Private)

#pragma mark - Init & Dealloc

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self methodInitBZAnimation];
    }
    return self;
}

- (void)methodInitBZAnimation
{
    _theDuration = 1.4;
    _theDelay = 0;
    _theSpringWithDamping = 0.2;
    _theInitialSpringVelocity = 0;
    _theOptions = UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction;
}

#pragma mark - Setters (Public)

- (void)setTheView:(UIView * _Nonnull)theView
{
    if (!theView)
    {
        abort();
    }
    if (isEqual(theView, _theView))
    {
        return;
    }
    _theView = theView;
}

- (void)setTheDelay:(double)theDelay
{
    if (theDelay < 0)
    {
        abort();
    }
    if (theDelay == _theDelay)
    {
        return;
    }
    _theDelay = theDelay;
}

- (void)setTheDuration:(double)theDuration
{
    if (theDuration < 0)
    {
        abort();
    }
    if (theDuration == _theDuration)
    {
        return;
    }
    _theDuration = theDuration;
}

- (void)setTheInitialSpringVelocity:(double)theInitialSpringVelocity
{
    if (theInitialSpringVelocity == _theInitialSpringVelocity)
    {
        return;
    }
    _theInitialSpringVelocity = theInitialSpringVelocity;
}

- (void)setTheSpringWithDamping:(double)theSpringWithDamping
{
    if (theSpringWithDamping == _theSpringWithDamping)
    {
        return;
    }
    _theSpringWithDamping = theSpringWithDamping;
}

- (void)setTheOptions:(UIViewAnimationOptions)theOptions
{
    if (theOptions == _theOptions)
    {
        return;
    }
    _theOptions = theOptions;
}

#pragma mark - Getters (Public)

#pragma mark - Setters (Private)

#pragma mark - Getters (Private)

#pragma mark - Lifecycle

#pragma mark - Create Views & Variables

#pragma mark - Actions

#pragma mark - Gestures

#pragma mark - Delegates ()

#pragma mark - Methods (Public)

- (void)methodSetAnimationBlock:(void (^ _Nonnull)())theAnimationBlock
{
    if (!theAnimationBlock)
    {
        abort();
    }
    self.theMainAnimationBlock = theAnimationBlock;
}

- (void)methodSetCompletionBlock:(void (^ _Nonnull)(BOOL isAnimationComplited))theCompletionBlock;
{
    if (!theCompletionBlock)
    {
        abort();
    }
    self.theMainCompletionBlock = theCompletionBlock;
}

- (void)methodStart
{
    if (self.theView)
    {
        [UIView transitionWithView:self.theView
                          duration:self.theDuration
                           options:self.theOptions
                        animations:^
         {
             if (!self.theMainAnimationBlock)
             {
                 abort();
             }
             self.theMainAnimationBlock();
         }
                        completion:^(BOOL finished)
         {
             NSLog(@"%d",finished);
             if (self.theMainCompletionBlock)
             {
                 self.theMainCompletionBlock(finished);
             }
         }];
        return;
    }
    [UIView animateWithDuration:self.theDuration
                          delay:self.theDelay
         usingSpringWithDamping:self.theSpringWithDamping
          initialSpringVelocity:self.theInitialSpringVelocity options:self.theOptions
                     animations:^
     {
         if (!self.theMainAnimationBlock)
         {
             abort();
         }
         self.theMainAnimationBlock();
     }
                     completion:^(BOOL finished)
     {
         if (self.theMainCompletionBlock)
         {
             self.theMainCompletionBlock(finished);
         }

     }];
}

#pragma mark - Methods (Private)

#pragma mark - Standard Methods

@end































