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

@interface BZViewController ()

@property (nonatomic, strong) UIView *theView;

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
    for (int i = 0; i < 50; i++)
    {
//        [BZExtensionsManager methodDispatchAfterSeconds:i
//                                   withBlock:^
//         {
//             NSLog(@"ты вовремя получил этот nslog? %zd",i);
//         }];
        [BZExtensionsManager methodAsyncBackgroundWithBlock:^{
            [BZExtensionsManager methodDispatchAfterSeconds:i
                                                  withBlock:^
             {
                 NSLog(@"ты вовремя получил этот nslog? %zd",i);
             }];
        }];
    }
   
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
 //   id objectFF = ((NSDictionary*)theLayoutsDictsArray[1])[@"Column1Header"];
//    if (!objectFF) NSLog(@"Ura");
    
    BZScrollContentUIView *theBZScrollContentUIView = [BZScrollContentUIView new];
    [self.view addSubview:theBZScrollContentUIView];
    for (int i = 0; i < 5; i++)
    {
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i*10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
        {
            theBZScrollContentUIView.theLayoutDictionary = theLayoutsDictsArray[i];
        });
    }
 //   theBZScrollContentUIView.theLayoutDictionary = theLayoutsDictsArray[3];
}

#pragma mark - Actions

#pragma mark - Gestures

#pragma mark - Delegates ()

#pragma mark - Methods (Public)

#pragma mark - Methods (Private)

-(void) testPerformSelector:(NSNumber *)number
{
    NSLog(@"ты вовремя получил этот nslog? %zd", [number integerValue]);
}
#pragma mark - Standard Methods

@end






























