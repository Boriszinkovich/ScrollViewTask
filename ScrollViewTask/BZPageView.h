//
//  BZPageView.h
//  ScrollViewTask
//
//  Created by BZ on 2/18/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger
{
    BZPageViewOrientationHorizontal = 1,
    BZPageViewOrientationVertical,
    BZPageViewOrientationEnumCount = BZPageViewOrientationVertical
} BZPageViewOrientation;

@protocol BZPageViewDelegate<NSObject>

@optional

- (void)pageViewScrolledToView:(UIView * _Nonnull)theView withIndex:(NSInteger)theIndex;

@end

@interface BZPageView : UIView

/// default is nill
@property(nullable,nonatomic,weak) id<BZPageViewDelegate> delegate;
@property (nonatomic, assign) BZPageViewOrientation theViewPagingOrientation;
/// default is 1.4
@property (nonatomic, assign) double theAnimationDuration;
/// defaults to 0.2
@property (nonatomic, assign) double theSpringDamping;
/// default UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction
@property (nonatomic, assign) UIViewAnimationOptions theAnimationOptions;
@property (nonatomic, assign, readonly) double theCurrentPageIndex;
/// add only afterSetting theWidth and theHeight
- (void)addPage:(UIView * _Nonnull)thePage;
- (void)scrollToViewWithIndex:(NSInteger)theIndex;

@end































