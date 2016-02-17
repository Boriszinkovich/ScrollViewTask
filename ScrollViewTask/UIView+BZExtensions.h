//
//  UIView+BZExtensions.h
//  ScrollViewTask
//
//  Created by BZ on 2/15/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BZExtensions)

@property (nonatomic, assign) double theMinX;
@property (nonatomic, assign) double theMinY;
/// set only after setting theWidth
@property (nonatomic, assign) double theCenterX;
/// set only after setting theHeight
@property (nonatomic, assign) double theCenterY;
/// set only after setting theWidth
@property (nonatomic, assign) double theMaxX;
/// set only after setting theHeight
@property (nonatomic, assign) double theMaxY;
@property (nonatomic, assign) double theWidth;
@property (nonatomic, assign) double theHeight;

@end






























