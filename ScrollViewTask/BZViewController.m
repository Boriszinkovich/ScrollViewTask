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
    UIView *theContainerView = [UIView new];
    [self.view addSubview:theContainerView];
    
    theContainerView.theWidth = 400;
    theContainerView.theHeight = 400;
    theContainerView.theMinX = 50;
    theContainerView.theMinY = 100;
    theContainerView.backgroundColor = [UIColor greenColor];
    
    
    UIView *theTopSeparatorView = theContainerView.theTopSeparatorView;
    theTopSeparatorView.backgroundColor = [UIColor yellowColor];
    theTopSeparatorView.theHeight = 20;
    
    UIView *theLeftSeparatorView = theContainerView.theLeftSeparatorView;
    theLeftSeparatorView.backgroundColor = [UIColor blackColor];
    theLeftSeparatorView.theWidth = 20;
//    theLeftSeparatorView.theHeight = 40;
    
    UIView *theBottomSeparatorView = theContainerView.theBottomSeparatorView;
    theBottomSeparatorView.backgroundColor = [UIColor redColor];
    theBottomSeparatorView.theHeight = 70;
    theBottomSeparatorView.theWidth = 300;
    UIView *theBottomSeparatorBottomSubview = theBottomSeparatorView.theBottomSeparatorView;
    {
        theBottomSeparatorBottomSubview.theHeight = 20;
        theBottomSeparatorBottomSubview.theWidth = 40;
        theBottomSeparatorBottomSubview.backgroundColor = [UIColor blueColor];
    }
    
    UIView *theRightSeparatorView = theContainerView.theRightSeparatorView;
    theRightSeparatorView.backgroundColor = [UIColor purpleColor];
    theRightSeparatorView.theWidth = 50;
    theRightSeparatorView.theHeight = 100;
    
//    theBottomSeparatorView.theMinX = 70;
//    theLeftSeparatorView.theCenterX = 30;
//    theRightSeparatorView.theMaxX = 20;
//    theBottomSeparatorLeftSubview.theMaxX = 100;
    NSLog(@"%f",theBottomSeparatorBottomSubview.theWidth);
    [UIView animateWithDuration:20
                          delay:3
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         theContainerView.theWidth -= theContainerView.theWidth/2;
         theContainerView.theHeight -= theContainerView.theHeight/2;
         theRightSeparatorView.theMinX = 0;
     }
                     completion:^(BOOL finished)
     {
         NSLog(@"%f",theBottomSeparatorBottomSubview.theWidth);
         NSLog(@"%f",theBottomSeparatorBottomSubview.theHeight);
         NSLog(@"%f",theRightSeparatorView.theHeight);
     }];
//
//////    [BZExtensionsManager methodDispatchAfterSeconds:3 withBlock:^
//////     {
//////         theBottomSeparatorView.theMinY = 200;
//////     }];
////    
////    [BZExtensionsManager methodDispatchAfterSeconds:6 withBlock:^
////     {
//////         theContainerView.theWidth = 200;
////         theContainerView.theHeight = 500;
//////         theBottomSeparatorView.theHeight = 100;
////     }];
//    
//    
//    [BZExtensionsManager methodDispatchAfterSeconds:3 withBlock:^
//     {
//         [UIView animateWithDuration:5
//                          animations:^
//          {
//              theBottomSeparatorView.theMinX = 0;
////              theContainerView.theWidth = 800;
//          }];
//         
//     }];
//    [BZExtensionsManager methodDispatchAfterSeconds:12 withBlock:^
//     {
////         [theBottomSeparatorView removeFromSuperview];
//         [UIView animateWithDuration:5
//                          animations:^
//          {
//              theContainerView.theWidth = 800;
////              theBottomSeparatorView.theHeight = 100;
////              theBottomSeparatorView.theWidth = 20;
//          }];
//         
//     }];
    
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
    return;
//    UIView *theContainerView = [UIView new];
//    [self.view addSubview:theContainerView];
//    
//    theContainerView.theWidth = 400;
//    theContainerView.theHeight = 400;
//    theContainerView.theMinX = 50;
//    theContainerView.theMinY = 100;
//    theContainerView.backgroundColor = [UIColor greenColor];
//    
//    BZAnimation *theAnimation = [BZAnimation new];
//    theAnimation.theDuration = 4;
//    [theAnimation methodSetAnimationBlock:^
//     {
//         theContainerView.theMinY = 80;
//     }];
    
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
    theMainBZPageView.theSpringDamping = 1;
//    theMainBZPageView.theViewPagingOrientation = BZPageViewOrientationVertical;
    theMainBZPageView.isInfinite = NO;
    
    
    
    UIView *theRedView = [UIView new];
    theRedView.theWidth = self.view.theWidth;
    theRedView.theHeight = self.view.theHeight;
    theRedView.backgroundColor = [UIColor redColor];
    theRedView.tag = 3;
    [theMainBZPageView methodAddPage:theRedView];
    
    
    UIView *theGreenView = [UIView new];
    theGreenView.theWidth = self.view.theWidth;
    theGreenView.theHeight = self.view.theHeight;
    theGreenView.backgroundColor = [UIColor greenColor];
    theGreenView.tag = 6;
    [theMainBZPageView methodAddPage:theGreenView];

    
    UIView *theBlueView = [UIView new];
    theBlueView.theWidth = self.view.theWidth;
    theBlueView.theHeight = self.view.theHeight;
    theBlueView.backgroundColor = [UIColor blueColor];
    theBlueView.tag = 9;
    [theMainBZPageView methodAddPage:theBlueView];
//    for (int i = 0; i < theLayoutsDictsArray.count; i++)
//    {
//        BZScrollContentUIView *theBZScrollContentUIView = [BZScrollContentUIView new];
//        theBZScrollContentUIView.theLayoutDictionary = theLayoutsDictsArray[i];
//        [theMainBZPageView methodAddPage:theBZScrollContentUIView];
//        
//    }
    theMainBZPageView.theDelegate = self;
    
    SMPageControl *theMainSMPageControl = [SMPageControl new];
    self.theMainSMPageControl = theMainSMPageControl;
    [self.view addSubview:theMainSMPageControl];
//    theMainSMPageControl.numberOfPages = theLayoutsDictsArray.count;
    theMainSMPageControl.numberOfPages = theMainBZPageView.subviews[0].subviews.count;
    theMainSMPageControl.pageIndicatorImage = [UIImage getImageNamed:@"product_page_off"];
    theMainSMPageControl.currentPageIndicatorImage = [UIImage getImageNamed:@"product_page_on"];
    [theMainSMPageControl sizeToFit];
    theMainSMPageControl.theWidth = theMainSMPageControl.superview.theHeight;
    theMainSMPageControl.theCenterY = theMainSMPageControl.superview.theHeight/2;
    theMainSMPageControl.theCenterX = theMainSMPageControl.superview.theWidth - theMainSMPageControl.theHeight/2;
    theMainSMPageControl.transform = CGAffineTransformRotate(theMainSMPageControl.transform, M_PI/2);
    theMainSMPageControl.currentPage = 0;
    theMainSMPageControl.tapBehavior = SMPageControlTapBehaviorStep;
    [theMainSMPageControl addTarget:self action:@selector(actionSMPageControlDidChange:)
               forControlEvents:UIControlEventValueChanged];
    
    
//    [BZExtensionsManager methodDispatchAfterSeconds:5
//                                          withBlock:^
//     {
//         theMainBZPageView.isInfinite = YES;
//     }];
}

#pragma mark - Actions

- (void)actionSMPageControlDidChange:(SMPageControl *)theSMPageControl
{
    NSLog(@"%ld",(long)theSMPageControl.currentPage);
    if (self.theMainBZPageView.isInfinite && theSMPageControl.tapBehavior == SMPageControlTapBehaviorStep)
    {
        NSInteger theLastIndex  = self.theMainBZPageView.theCountOfPages - 1;
        if (theSMPageControl.currentPage < self.theMainBZPageView.theCurrentPageIndex ||
            (!theSMPageControl.currentPage && self.theMainBZPageView.theCurrentPageIndex == 0))
        {
            [self.theMainBZPageView methodScrollToPreviousPage];
        }
        else if (theSMPageControl.currentPage > self.theMainBZPageView.theCurrentPageIndex ||
                 (theSMPageControl.currentPage ==  theLastIndex && self.theMainBZPageView.theCurrentPageIndex == theLastIndex))
        {
            [self.theMainBZPageView methodScrollToNextPage];
        }
        return;
    }
//    [self.theMainBZPageView methodScrollToViewWithIndex:theSMPageControl.currentPage];
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






























