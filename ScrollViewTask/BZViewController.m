//
//  ViewController.m
//  ScrollViewTask
//
//  Created by BZ on 2/15/16.
//  Copyright © 2016 BZ. All rights reserved.
//

#import "BZViewController.h"

#import "BZScrollContentUIView.h"
#import "BZExtensionsManager.h"

@interface BZViewController () <UIGestureRecognizerDelegate, UIScrollViewDelegate, BZPageViewDelegate>

@property (nonatomic, strong, nonnull) UIView *theContainerView;
@property (nonatomic, strong, nonnull) BZPageView *theMainBZPageView;
@property (nonatomic, strong, nonnull) SMPageControl *theMainSMPageControl;

@end

@implementation BZViewController

#pragma mark - Class Methods (Public)

#pragma mark - Class Methods (Private)

#pragma mark - Init & Dealloc

#pragma mark - Setters (Public)

#pragma mark - Getters (Public)

#pragma mark - Setters (Private)

#pragma mark - Getters (Private)

#pragma mark - Lifecycle

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.isFirstLoad)
    {
        [self createAllViews];
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    UIButton *theButton = [UIButton new];
//    [self.view addSubview:theButton];
//    theButton.frame = self.view.frame;
//    theButton.backgroundColor = [UIColor redColor];
//    theButton.alpha = 0.05;
//    [theButton addTarget:self action:@selector(actionPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)actionPressed:(UIButton *)theButton
{
    theButton.alpha = 0.6;
    BZAnimation *theFinishedBZAnimation = [BZAnimation new];
    theFinishedBZAnimation.theOptions = UIViewAnimationOptionBeginFromCurrentState;
    theFinishedBZAnimation.theDuration = 8;
    theFinishedBZAnimation.theSpringWithDamping = 1;
    [theFinishedBZAnimation methodSetAnimationBlock:^
     {
         theButton.alpha = 1;
     }];
    [theFinishedBZAnimation methodSetCompletionBlock:^(BOOL finished)
     {
         NSLog(@"%d",finished);
     }];
    [theFinishedBZAnimation methodStart];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    if (self.isFirstLoad)
//    {
//        self.isFirstLoad = NO;
//    }
//    BZAnimation *theBZAnimation = [BZAnimation new];
//    theBZAnimation.theDuration = 0.6;
//    UILabel *theExampleLabel = [UILabel new];
//    theExampleLabel.theWidth = 100;
//    theExampleLabel.theHeight = 100;
//    theExampleLabel.theMinX = 100;
//    theExampleLabel.theMinY = 100;
//    theExampleLabel.backgroundColor = [UIColor blueColor];
//    
//    UIView *theContainerView = [UIView new];
//    theContainerView.theMinY = 100;
//    theContainerView.theMinX = 100;
//    theContainerView.theWidth = 700;
//    theContainerView.theHeight = 700;
//    theContainerView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:theContainerView];
//    [theContainerView addSubview:theExampleLabel];
//    theBZAnimation.theOptions = UIViewAnimationOptionTransitionFlipFromLeft;
//    theBZAnimation.theView = self.view;
//    UIView *theSecondView = [UIView new];
//    theSecondView.theMinX = 400;
//    theSecondView.theMinY = 400;
//    theSecondView.theHeight = 300;
//    theSecondView.theWidth = 300;
//    theSecondView.backgroundColor = [UIColor greenColor];
//    [theBZAnimation methodSetAnimationBlock:^
//    {
//        [theExampleLabel removeFromSuperview];
//        [theContainerView addSubview:theSecondView];
//    }];
//    [theBZAnimation methodSetCompletionBlock:^(BOOL theIsAnimationComplited)
//    {
//        NSLog(@"completed");
//    }];
//
//    [self.view addSubview:theExampleLabel];
////    theBZAnimation.theOptions = UIViewAnimationCurveLinear;
////    [theBZAnimation methodSetAnimationBlock:^{
////        theExampleLabel.theMinY = 300;
////        theExampleLabel.theMinX = 300;
////    }];
////    [theBZAnimation methodSetCompletionBlock:^(BOOL theIsAnimationComplited)
////     {
////         NSLog(@"completed");
////     }];
//    
//    [theBZAnimation methodStart];
//}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Create Views & Variables

- (void)createAllViews
{
    if (!self.isFirstLoad)
    {
        return;
    }
    self.isFirstLoad = NO;
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSString *theFilePath = [[NSBundle mainBundle] pathForResource:@"bz_layout_data" ofType:@"json"];
    
    NSString *theJSONString = [[NSString alloc] initWithContentsOfFile:theFilePath
                                                              encoding:NSUTF8StringEncoding error:NULL];
    NSData *theJSONData = [theJSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *theJsonError;
    NSDictionary *theJsonDictionary = [NSJSONSerialization JSONObjectWithData:theJSONData
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:&theJsonError];
    theJsonDictionary = [theJsonDictionary theDictionaryWithoutNulls];
    NSArray *theLayoutsDictsArray = [theJsonDictionary objectForKey:@"Slides"];
    
    BZPageView *theMainBZPageView = [BZPageView new];
    self.theMainBZPageView = theMainBZPageView;
    [self.view addSubview:theMainBZPageView];
    theMainBZPageView.theWidth = theMainBZPageView.superview.theWidth;
    theMainBZPageView.theHeight = theMainBZPageView.superview.theHeight;
    theMainBZPageView.theSpringDamping = 0.9;
    for (int i = 0; i < theLayoutsDictsArray.count; i++)
    {
        BZScrollContentUIView *theBZScrollContentUIView = [BZScrollContentUIView new];
        theBZScrollContentUIView.theLayoutDictionary = theLayoutsDictsArray[i];
        [theMainBZPageView methodAddPage:theBZScrollContentUIView];
        
    }
    theMainBZPageView.theDelegate = self;
    
    SMPageControl *theMainSMPageControl = [SMPageControl new];
    self.theMainSMPageControl = theMainSMPageControl;
    [self.view addSubview:theMainSMPageControl];
    theMainSMPageControl.numberOfPages = theLayoutsDictsArray.count;
    theMainSMPageControl.pageIndicatorImage = [UIImage getImageNamed:@"product_page_off"];
    theMainSMPageControl.currentPageIndicatorImage = [UIImage getImageNamed:@"product_page_on"];
    [theMainSMPageControl sizeToFit];
    theMainSMPageControl.theWidth = theMainSMPageControl.superview.theHeight;
    theMainSMPageControl.theCenterY = theMainSMPageControl.superview.theHeight/2;
    theMainSMPageControl.theCenterX = theMainSMPageControl.superview.theWidth - theMainSMPageControl.theHeight/2;
    theMainSMPageControl.transform = CGAffineTransformRotate(theMainSMPageControl.transform, M_PI/2);
    theMainSMPageControl.currentPage = 0;
    theMainSMPageControl.tapBehavior = SMPageControlTapBehaviorStep;
    [theMainSMPageControl addTarget:self action:@selector(actionSMPageControlDidChanged:)
               forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Actions

- (void)actionSMPageControlDidChanged:(SMPageControl *)theSMPageControl
{
    if (theSMPageControl.currentPage == self.theMainBZPageView.theCurrentPageIndex)
    {
        return;
    }
    [self.theMainBZPageView methodScrollToViewWithIndex:theSMPageControl.currentPage];
}

#pragma mark - Gestures

#pragma mark - Delegates (BZPageViewDelegate)

- (void)pageView:(BZPageView * _Nonnull)theBZPageView
 didScrollToView:(UIView * _Nonnull)theView
         atIndex:(NSInteger)theIndex
{
    self.theMainSMPageControl.currentPage = theIndex;
}

#pragma mark - Methods (Public)

#pragma mark - Methods (Private)

#pragma mark - Standard Methods

@end






























