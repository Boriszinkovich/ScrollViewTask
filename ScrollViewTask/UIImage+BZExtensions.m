//
//  UIImage+BZExtensions.m
//  ScrollViewTask
//
//  Created by BZ on 2/16/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import "UIImage+BZExtensions.h"

@implementation UIImage (BZExtensions)

+ (UIImage * _Nullable)getImageNamed:(NSString * _Nonnull)theImageName
{
    NSString *theImageResolutionNumber;
    BOOL theIsRetinaDisplay = ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]
                               && ([UIScreen mainScreen].scale >= 2.0));
    if (theIsRetinaDisplay)
    {
        theImageResolutionNumber = @"2";
    }
    else
    {
        theImageResolutionNumber = @"1";
    }
    NSString *theFileName = [NSString stringWithFormat:@"%@@%@x.png",theImageName,theImageResolutionNumber];
    UIImage* theImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:theFileName ofType:nil]];
    return theImage;
}

@end






























