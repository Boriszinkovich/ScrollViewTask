//
//  BZScrollContentUIView.m
//  ScrollViewTask
//
//  Created by BZ on 2/15/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import "BZScrollContentUIView.h"

#import "BZExtensionsManager.h"

typedef enum : NSUInteger
{
    BZScrollContentUIViewLayout14 = 14,
    BZScrollContentUIViewLayout15 = 15,
    BZScrollContentUIViewLayout16 = 16
} BZScrollContentUIViewLayout;

NSString* const theBrandLabelColorFor16Layout = @"9a9a9a";
NSString* const theGreyContentColor = @"666666";
NSString* const theHeaderColor = @"ff7303";

@interface BZScrollContentUIView ()

@property (nonatomic, strong, nonnull) UIImageView *theBackgroundImage;
@property (nonatomic, strong, nonnull) UILabel *theBrandLabel;
@property (nonatomic, strong, nonnull) UILabel *theHeaderLabel;
@property (nonatomic, strong, nonnull) UIImageView *theLeftView;
@property (nonatomic, strong, nonnull) UILabel *theContentLabel;
@property (nonatomic, strong, nonnull) NSArray<UIImageView *> *theArrayOfImages;
@property (nonatomic, strong, nonnull) NSArray<UILabel *> *theArrayOfImagesLabels;
@property (nonatomic, strong, nonnull) NSArray<UILabel *> *theArrayOfTitleLabels;
@property (nonatomic, strong, nonnull) NSArray<UILabel *> *theArrayOfContentLabels;

@end

@implementation BZScrollContentUIView

#pragma mark - Class Methods (Public)

#pragma mark - Class Methods (Private)

#pragma mark - Init & Dealloc

#pragma mark - Setters (Public)

- (void)setTheLayoutDictionary:(NSDictionary * _Nonnull)theLayoutDictionary
{
    if (!theLayoutDictionary)
    {
        abort();
    }
  //  NSLog(@"%@", theLayoutDictionary);
    if (isEqual(theLayoutDictionary, _theLayoutDictionary))
    {
        return;
    }
    _theLayoutDictionary = theLayoutDictionary;
    
    [self createAllViews];
    
    NSInteger theLayoutIndex = [((NSString *)theLayoutDictionary[@"Layout"]) integerValue];
    if (theLayoutIndex < 14 || theLayoutIndex > 16)
    {
        abort();
    }
    self.theBackgroundImage.image = [UIImage imageWithContentsOfFile:
                                     [[NSBundle mainBundle] pathForResource:_theLayoutDictionary[@"BackgroundImage"]
                                                                     ofType:nil]];
    switch (theLayoutIndex)
    {
        case BZScrollContentUIViewLayout14:
        {
            [self setHiddenForImagesAndTitlesOf16Layout:YES];
            if (self.theArrayOfTitleLabels[0].hidden)
            {
                [self setHiddenForLabelsOf14Layout:NO];
            }
            self.theLeftView.hidden = YES;
            self.theContentLabel.hidden = YES;
            
            self.theBrandLabel.textColor = [UIColor whiteColor];
            NSString *theHeaderText = theLayoutDictionary[@"Header"];
            self.theHeaderLabel.text = theHeaderText;
            self.theHeaderLabel.theWidth = 500;
            [self.theHeaderLabel sizeToFit];
            self.theHeaderLabel.theWidth = 500;
            for (int i = 0; i < self.theArrayOfTitleLabels.count; i++)
            {
                UILabel *theCurrentTitleLabel = self.theArrayOfTitleLabels[i];
                theCurrentTitleLabel.theMinY = self.theHeaderLabel.theMaxY + 30;
                UILabel *theCurrentContentLabel = self.theArrayOfContentLabels[i];
                if (i > 2)
                {
                    abort();
                }
                switch (i)
                {
                    case 0:
                        theCurrentTitleLabel.text  = theLayoutDictionary[@"Column1Header"];
                        theCurrentContentLabel.text = theLayoutDictionary[@"Column1Text"];
                        break;
                    case 1:
                        theCurrentTitleLabel.text  = theLayoutDictionary[@"Column2Header"];
                        theCurrentContentLabel.text = theLayoutDictionary[@"Column2Text"];
                        break;
                    case 2:
                        theCurrentTitleLabel.text  = theLayoutDictionary[@"Column3Header"];
                        theCurrentContentLabel.text = theLayoutDictionary[@"Column3Text"];
                        break;
                }
                [theCurrentTitleLabel sizeToFit];
                theCurrentTitleLabel.theWidth = 270;
                theCurrentContentLabel.theMinY = theCurrentTitleLabel.theMaxY + 14;
                [theCurrentContentLabel sizeToFit];
                theCurrentContentLabel.theWidth = 270;
            }
          
            break;
        }
        case BZScrollContentUIViewLayout15:
        {
            [self setHiddenForImagesAndTitlesOf16Layout:YES];
            [self setHiddenForLabelsOf14Layout:YES];
            if (self.theLeftView.hidden)
            {
                self.theLeftView.hidden = NO;
                self.theContentLabel.hidden = NO;
            }
            
            self.theLeftView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.66];
            self.theBrandLabel.textColor = [UIColor whiteColor];
            self.theHeaderLabel.text = theLayoutDictionary[@"Header"];
            self.theHeaderLabel.theWidth = 500;
            [self.theHeaderLabel sizeToFit];
            self.theHeaderLabel.theWidth = 500;
            
            [self adjustContentLabel];
            self.theContentLabel.textColor = [UIColor whiteColor];
        }
            break;
        case BZScrollContentUIViewLayout16:
        {
            [self setHiddenForLabelsOf14Layout:YES];
            if (self.theLeftView.hidden)
            {
                self.theLeftView.hidden = NO;
                self.theContentLabel.hidden = NO;
                [self setHiddenForImagesAndTitlesOf16Layout:NO];
            }
            
            self.theLeftView.backgroundColor = [[UIColor whiteColor]
                                                colorWithAlphaComponent:0.85];
            self.theBrandLabel.textColor = [UIColor colorWithHexString:theBrandLabelColorFor16Layout];
            
            NSString *theHeaderText = _theLayoutDictionary[@"Header"];
            self.theHeaderLabel.text = theHeaderText;
            self.theHeaderLabel.theWidth = 500;
            [self.theHeaderLabel sizeToFit];
            self.theHeaderLabel.theWidth = 500;
            
            [self adjustContentLabel];
            self.theContentLabel.textColor = [UIColor colorWithHexString:
                                              theGreyContentColor];
            
            for (int i = 0; i < self.theArrayOfImages.count; i++)
            {
                UIImageView *theCurrentImageView = self.theArrayOfImages[i];
                theCurrentImageView.theMinY = self.theContentLabel.theMaxY + 50;
                
                UILabel *theCurrentLabel = self.theArrayOfImagesLabels[i];
                theCurrentLabel.theMinY = theCurrentImageView.theMaxY + 16;
                switch (i)
                {
                    case 0:
                        theCurrentImageView.image = [UIImage imageWithContentsOfFile:
                                                     [[NSBundle mainBundle] pathForResource:
                                                      theLayoutDictionary[@"Fact1Image"] ofType:nil]];
                        theCurrentLabel.text = theLayoutDictionary[@"Fact1Text"];
                        break;
                    case 1:
                        theCurrentImageView.image = [UIImage imageWithContentsOfFile:
                                                     [[NSBundle mainBundle] pathForResource:
                                                      theLayoutDictionary[@"Fact2Image"] ofType:nil]];
                        theCurrentLabel.text = theLayoutDictionary[@"Fact2Text"];
                        break;
                    case 2:
                        theCurrentImageView.image = [UIImage imageWithContentsOfFile:
                                                     [[NSBundle mainBundle] pathForResource:
                                                      theLayoutDictionary[@"Fact3Image"] ofType:nil]];
                        theCurrentLabel.text = theLayoutDictionary[@"Fact3Text"];
                        break;
                }
                [theCurrentLabel sizeToFit];
                theCurrentLabel.theWidth = 156;
            }
            break;
        }
    }
}

#pragma mark - Getters (Public)

#pragma mark - Setters (Private)

#pragma mark - Getters (Private)

#pragma mark - Lifecycle

#pragma mark - Create Views & Variables

- (void)createAllViews
{
    if (!self.isFirstLoad)
    {
        return;
    }
    self.isFirstLoad = NO;
    
    UIWindow *theWindow = [UIApplication sharedApplication].keyWindow;
    
    self.theWidth = theWindow.theWidth;
    self.theHeight = theWindow.theHeight;
    
    NSInteger theLeftContentPadding = 50;
    
    UIImageView *theBackgroundImage = [UIImageView new];
    self.theBackgroundImage =  theBackgroundImage;
    [self addSubview:theBackgroundImage];
    theBackgroundImage.theWidth = theBackgroundImage.superview.theWidth;
    theBackgroundImage.theHeight = theBackgroundImage.superview.theHeight;
    
    UIImageView *theLeftView = [UIImageView new];
    self.theLeftView = theLeftView;
    [self addSubview:theLeftView];
    theLeftView.theHeight = theLeftView.superview.theHeight;
    theLeftView.theWidth = 600;
    
    UILabel *theBrandLabel = [UILabel new];
    self.theBrandLabel = theBrandLabel;
    [self addSubview:theBrandLabel];
    theBrandLabel.text = @"Our Brand";
    theBrandLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
    theBrandLabel.theMinX = theLeftContentPadding;
    theBrandLabel.theMinY = 58;
    [theBrandLabel sizeToFit];
    
    UILabel *theHeaderLabel = [UILabel new];
    self.theHeaderLabel = theHeaderLabel;
    [self addSubview:theHeaderLabel];
    theHeaderLabel.numberOfLines = 0;
    theHeaderLabel.font  =  [UIFont boldSystemFontOfSize:51];
    theHeaderLabel.theMinX = theLeftContentPadding;
    theHeaderLabel.theMinY = self.theBrandLabel.theMaxY + 50;
    theHeaderLabel.textColor = [UIColor colorWithHexString:theHeaderColor];
    
    UILabel *theContentLabel = [UILabel new];
    self.theContentLabel = theContentLabel;
    [self addSubview:theContentLabel];
    theContentLabel.numberOfLines = 0;
    theContentLabel.font = [UIFont boldSystemFontOfSize:24];
    theContentLabel.theMinX = theLeftContentPadding;
    
    // create images and titles for 16 layout
    NSMutableArray *theArrayWithImages = [NSMutableArray new];
    self.theArrayOfImages = theArrayWithImages;
    
    NSMutableArray *theArrayOfImagesLables = [NSMutableArray array];
    self.theArrayOfImagesLabels = theArrayOfImagesLables;
    
    NSInteger theBottomContentInsets = 16;
    NSInteger theSizeOfImagesAndLabels = 156;
    for (int i = 0; i < 3; i++)
    {
        UIImageView *theImageView = [UIImageView new];
        [self addSubview:theImageView];
        [theArrayWithImages addObject:theImageView];
        theImageView.theMinX = theLeftContentPadding + i * theBottomContentInsets + i * theSizeOfImagesAndLabels;
        theImageView.theWidth = theSizeOfImagesAndLabels;
        theImageView.theHeight = theSizeOfImagesAndLabels;
        
        UILabel *theCurrentLabel = [UILabel new];
        [self addSubview:theCurrentLabel];
        [theArrayOfImagesLables addObject:theCurrentLabel];
         theCurrentLabel.numberOfLines = 0;
        theCurrentLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        theCurrentLabel.theMinX = theLeftContentPadding + i * theBottomContentInsets + i * theSizeOfImagesAndLabels;
        theCurrentLabel.theWidth = theSizeOfImagesAndLabels;
        theCurrentLabel.textAlignment = NSTextAlignmentCenter;
        theCurrentLabel.textColor = [UIColor colorWithHexString:theGreyContentColor];
    }
    
    // create title labels and content labels for 14 layout
    NSMutableArray *theArrayWithTitleLabels = [NSMutableArray array];
    self.theArrayOfTitleLabels = theArrayWithTitleLabels;
    
    NSMutableArray *theArrayWithContentLabels = [NSMutableArray array];
    self.theArrayOfContentLabels = theArrayWithContentLabels;
    
    NSInteger theWidthOfLabels = 270;
    NSInteger theInsetsBeetwenTitles = 50;
    for (int i = 0; i < 3; i++)
    {
        UILabel *theTitleLabel = [UILabel new];
        [self addSubview:theTitleLabel];
        [theArrayWithTitleLabels addObject:theTitleLabel];
        theTitleLabel.font = [UIFont boldSystemFontOfSize:24];
        theTitleLabel.numberOfLines = 0;
        theTitleLabel.theMinX = theLeftContentPadding + theInsetsBeetwenTitles * i + theWidthOfLabels * i;
        theTitleLabel.theWidth = theWidthOfLabels;
        theTitleLabel.textColor = [UIColor whiteColor];
        
        UILabel *theContentLabel = [UILabel new];
        [self addSubview:theContentLabel];
        [theArrayWithContentLabels addObject:theContentLabel];
        theContentLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:18];
        theContentLabel.numberOfLines = 0;
        theContentLabel.theMinX = theLeftContentPadding + theInsetsBeetwenTitles * i + theWidthOfLabels * i;
        theContentLabel.theWidth = theWidthOfLabels;
        theContentLabel.textColor = [UIColor whiteColor];
    }
}

#pragma mark - Actions

#pragma mark - Gestures

#pragma mark - Delegates ()

#pragma mark - Methods (Public)

#pragma mark - Methods (Private)

- (void)setHiddenForImagesAndTitlesOf16Layout:(BOOL)hidden
{
    for (int i = 0; i < 3; i++)
    {
        UIImageView *theCurrentImageView = self.theArrayOfImages[i];
        theCurrentImageView.hidden = hidden;
        
        UILabel *theCurrentLabel = self.theArrayOfImagesLabels[i];
        theCurrentLabel.hidden = hidden;
    }
}

- (void)setHiddenForLabelsOf14Layout:(BOOL)hidden
{
    for (int i = 0; i < self.theArrayOfTitleLabels.count; i++)
    {
        UILabel *theTitleLabel = self.theArrayOfTitleLabels[i];
        theTitleLabel.hidden = hidden;
        UILabel *theContentLabel = self.theArrayOfContentLabels[i];
        theContentLabel.hidden = hidden;
    }
}
- (void)adjustContentLabel
{
    self.theContentLabel.text = _theLayoutDictionary[@"Summary"];
    self.theContentLabel.theMinY = self.theHeaderLabel.theMaxY + 30;
    double theWidth = self.theLeftView.theWidth - self.theContentLabel.theMinX*2;
    self.theContentLabel.theWidth = theWidth;
    [self.theContentLabel sizeToFit];
    self.theContentLabel.theWidth = theWidth;
}

#pragma mark - Standard Methods

@end






























