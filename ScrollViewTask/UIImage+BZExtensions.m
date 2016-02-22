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
    NSString *theFileName = [NSString stringWithFormat:@"%@%@x.png",theImageName,theImageResolutionNumber];
    UIImage* theImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:theFileName ofType:nil]];
    return theImage;
}

+ (UIImage * _Nonnull)getImageWithImage:(UIImage* _Nonnull)theOriginalImage scaledToSize:(CGSize)theSize
{
    if (!theOriginalImage)
    {
        abort();
    }
    if (CGSizeEqualToSize(theOriginalImage.size, theSize))
    {
        return theOriginalImage;
    }
    
    UIGraphicsBeginImageContextWithOptions(theSize, NO, 0.0f);
    
    [theOriginalImage drawInRect:CGRectMake(0.0f, 0.0f, theSize.width, theSize.height)];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end






























