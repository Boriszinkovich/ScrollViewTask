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

@interface BZPageView : UIView

@property (nonatomic, assign) BZPageViewOrientation theViewPagingOrientation;
/// default is 1.4
@property (nonatomic, assign) double theDuration;
/// defaults to 0.2
@property (nonatomic, assign) double theDamping;
/// default UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction
@property (nonatomic, assign) UIViewAnimationOptions theOptions;
/// add only afterSetting theWidth and theHeight
- (void)addPage:(UIView *)thePage;

@end































