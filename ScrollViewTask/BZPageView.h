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

@protocol BZPageViewDelegate;
@interface BZPageView : UIView

@property(nonatomic, weak, nullable) id<BZPageViewDelegate> theDelegate;
@property (nonatomic, assign) BZPageViewOrientation theViewPagingOrientation;
/// default is 1.4
@property (nonatomic, assign) double theAnimationDuration;
/// defaults to 0.2
@property (nonatomic, assign) double theSpringDamping;
/// default UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction
@property (nonatomic, assign) UIViewAnimationOptions theAnimationOptions;
@property (nonatomic, assign, readonly) double theCurrentPageIndex;
/// add only afterSetting theWidth and theHeight
- (void)methodAddPage:(UIView * _Nonnull)thePage;
- (void)methodScrollToViewWithIndex:(NSInteger)theIndex;

@end

@protocol BZPageViewDelegate<NSObject>

@optional

- (void)pageView:(BZPageView * _Nonnull)theBZPageView didScrollToView:(UIView * _Nonnull)theView
                 atIndex:(NSInteger)theIndex;

@end































