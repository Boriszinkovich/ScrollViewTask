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
@property (nonatomic, strong, nonnull) BZPageView *thePageView;
@property (nonatomic, strong, nonnull) SMPageControl *thePageControl;

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
    //    for (int i = 0; i < 50; i++)
    //    {
    ////        [BZExtensionsManager methodDispatchAfterSeconds:i
    ////                                   withBlock:^
    ////         {
    ////             NSLog(@"ты вовремя получил этот nslog? %zd",i);
    ////         }];
    //        [BZExtensionsManager methodAsyncBackgroundWithBlock:^{
    //            [BZExtensionsManager methodDispatchAfterSeconds:i
    //                                                  withBlock:^
    //             {
    //                 NSLog(@"ты вовремя получил этот nslog? %zd",i);
    //             }];
    //        }];
    //    }
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
    if (self.isFirstLoad)
    {
        self.isFirstLoad = NO;
    }
}

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
    
    NSString *theJSONString = [[NSString alloc] initWithContentsOfFile:theFilePath encoding:NSUTF8StringEncoding error:NULL];
    NSData* theJSONData = [theJSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *theJsonError;
    NSDictionary *theJsonDictionary = [NSJSONSerialization JSONObjectWithData:theJSONData options:NSJSONReadingMutableContainers error:&theJsonError];
    theJsonDictionary = [theJsonDictionary theDictionaryWithoutNulls];
    NSArray* theLayoutsDictsArray = [theJsonDictionary objectForKey:@"Slides"];
    
    BZPageView *thePageView = [BZPageView new];
    self.thePageView = thePageView;
    [self.view addSubview:thePageView];
    thePageView.theWidth = thePageView.superview.theWidth;
    thePageView.theHeight = thePageView.superview.theHeight;
    thePageView.theSpringDamping = 0.9;
    for (int i = 0; i < theLayoutsDictsArray.count; i++)
    {
        BZScrollContentUIView *theBZScrollContentUIView = [BZScrollContentUIView new];
        theBZScrollContentUIView.theLayoutDictionary = theLayoutsDictsArray[i];
        [thePageView addPage:theBZScrollContentUIView];
        
    }
//    thePageView.theViewPagingOrientation = BZPageViewOrientationHorizontal;
    thePageView.delegate = self;
    
    SMPageControl *theSMPageControl = [SMPageControl new];
    self.thePageControl = theSMPageControl;
    [self.view addSubview:theSMPageControl];
    theSMPageControl.theWidth = theSMPageControl.superview.theWidth;
    theSMPageControl.theHeight = 40;
    theSMPageControl.theCenterY = theSMPageControl.superview.theHeight/2;
//    theSMPageControl.theCenterX = theSMPageControl.superview.theWidth - theSMPageControl.minHeight;
    theSMPageControl.theCenterX = theSMPageControl.superview.theWidth - theSMPageControl.theHeight;
    theSMPageControl.numberOfPages = theLayoutsDictsArray.count;
    theSMPageControl.backgroundColor = [UIColor redColor];
    theSMPageControl.pageIndicatorImage = [UIImage getImageNamed:@"product_page_off"];
    theSMPageControl.currentPageIndicatorImage = [UIImage getImageNamed:@"product_page_on"];
    [theSMPageControl sizeToFit];
    theSMPageControl.theWidth = theSMPageControl.superview.theWidth;
//    theSMPageControl.theHeight = 40;
    theSMPageControl.theCenterY = theSMPageControl.superview.theHeight/2;
    //    theSMPageControl.theCenterX = theSMPageControl.superview.theWidth - theSMPageControl.minHeight;
    theSMPageControl.theCenterX = theSMPageControl.superview.theWidth - theSMPageControl.theHeight;
    
    CGAffineTransform transform = CGAffineTransformRotate(theSMPageControl.transform, M_PI/2);
    theSMPageControl.transform = transform;
    
    theSMPageControl.currentPage = 0;
    theSMPageControl.tapBehavior = SMPageControlTapBehaviorStep;
    [theSMPageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
  //  [theSMPageControl setFrame:CGRectMake(100, 100, 400, 400)];
//    BZPageView *thePageView = [BZPageView new];
//    [self.view addSubview:thePageView];
//    thePageView.theWidth = 300;
//    thePageView.theHeight = 300;
//    thePageView.theMinX = 200;
//    thePageView.theMinY = 50;
//    thePageView.theViewPagingOrientation = BZPageViewOrientationVertical;
//    thePageView.backgroundColor = [UIColor grayColor];
//    
//    
//    for (int i = 0; i < 30; i++)
//    {
//        UIView *theView = [UIView new];
//        theView.theHeight = 100 + i* 2;
//        theView.theWidth = 100 + i * 2;
//        theView.backgroundColor = [UIColor redColor];
//        {
//            UIView *theSeparatorView = [UIView new];
//            [theView addSubview:theSeparatorView];
//            switch (thePageView.theViewPagingOrientation)
//            {
//                case BZPageViewOrientationHorizontal:
//                    theSeparatorView.theWidth = 10;
//                    theSeparatorView.theHeight = theView.theHeight;
//                    theSeparatorView.theMinX = theView.theMaxX - theSeparatorView.theWidth;
//                    theSeparatorView.theMinY = theView.theMinY;
//                    break;
//                    
//                case BZPageViewOrientationVertical:
//                    theSeparatorView.theWidth = theView.theWidth;
//                    theSeparatorView.theHeight = 10;
//                    theSeparatorView.theMinX = theView.theMinX;
//                    theSeparatorView.theMinY = theView.theMaxY - theSeparatorView.theHeight;
//                    break;
//            }
//            theSeparatorView.backgroundColor = [UIColor greenColor];
//        }
//        
//        UILabel *theLabel = [UILabel new];
//        [theView addSubview:theLabel];
//        theLabel.theMinX = 40;
//        theLabel.theMinY = 40;
//        theLabel.text = [NSString stringWithFormat:@"%ld", (long) i];
//        [theLabel sizeToFit];
//        theLabel.theCenterX = theLabel.superview.theWidth/2;
//        theLabel.theCenterY = theLabel.superview.theHeight/2;
//        
//        
//        [thePageView addPage:theView];
//    }
//    [BZExtensionsManager methodDispatchAfterSeconds:6
//                                          withBlock:^
//     {
//         thePageView.theViewPagingOrientation = BZPageViewOrientationVertical;
//         thePageView.theDamping = 0.7;
//         thePageView.theDuration = 5;
//     }];
//
//    
}

#pragma mark - Actions

#pragma mark - Gestures

#pragma mark - Delegates ()

- (void)pageViewScrolledToView:(UIView * _Nonnull)theView withIndex:(NSInteger)theIndex;
{
    NSLog(@"Scrolled to %ld", theIndex);
    self.thePageControl.currentPage = theIndex;
}

#pragma mark - Methods (Public)

#pragma mark - Methods (Private)

-(void) testPerformSelector:(NSNumber *)number
{
    NSLog(@"ты вовремя получил этот nslog? %zd", [number integerValue]);
}

- (void)pageControlValueChanged:(SMPageControl *)sender
{
    NSLog(@"%ld", sender.currentPage);
    if (sender.currentPage == self.thePageView.theCurrentPageIndex)
    {
        return;
    }
    [self.thePageView scrollToViewWithIndex:sender.currentPage];
}

#pragma mark - Standard Methods

@end






























