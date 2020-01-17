//
//  SearchVC.m
//  Random Activity Generator
//
//  Created by Dan Pham on 1/8/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

#import "SearchVC.h"
#import "ActivityView.h"

@interface SearchVC ()

@property (assign, nonatomic) NSString* activityType;
@property (assign, nonatomic) NSString* activityDescription;

@property (strong, nonatomic) UIButton* busyWorkButton;
@property (strong, nonatomic) UIButton* charityButton;
@property (strong, nonatomic) UIButton* cookingButton;
@property (strong, nonatomic) UIButton* diyButton;
@property (strong, nonatomic) UIButton* educationButton;
@property (strong, nonatomic) UIButton* musicButton;
@property (strong, nonatomic) UIButton* randomButton;
@property (strong, nonatomic) UIButton* recreationButton;
@property (strong, nonatomic) UIButton* relaxationButton;
@property (strong, nonatomic) UIButton* socialButton;

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemGray2Color];
    [self setupButtonConstraints];
}

- (void)setupButtonConstraints {
    CGFloat width = self.view.bounds.size.width;
    CGFloat statusBarHeight = 44;
    CGFloat bottomBarHeight = 34;
    CGFloat tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    CGFloat height = self.view.bounds.size.height - statusBarHeight - bottomBarHeight - tabBarHeight;
    CGFloat minimumItemSpacing = 16;
    CGFloat padding = 16;
    CGFloat availableWidth = width - (padding * 2) - minimumItemSpacing;
    CGFloat itemWidth = availableWidth / 2;
    CGFloat availableHeight = height - (padding * 2) - (minimumItemSpacing * 4);
    CGFloat itemHeight = availableHeight / 5;
    CGFloat statusBarHeightWithPadding = statusBarHeight + padding;
    
    self.busyWorkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self setupButton:self.busyWorkButton :@"Busy work" :padding :statusBarHeightWithPadding :itemWidth :itemHeight];
    self.busyWorkButton.tag = 1;
    [self.view addSubview:self.busyWorkButton];
    
    CGFloat rightColumnXCoordinate = self.busyWorkButton.frame.origin.x + self.busyWorkButton.frame.size.width + minimumItemSpacing;
    CGFloat yCoordinate = 0;
    
    self.charityButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self setupButton:self.charityButton :@"Charity" :rightColumnXCoordinate :statusBarHeightWithPadding :itemWidth :itemHeight];
    self.charityButton.tag = 2;
    [self.view addSubview:self.charityButton];
    
    self.cookingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yCoordinate = *[self getRowYCoordinate:statusBarHeightWithPadding :padding :itemHeight :1];
    [self setupButton:self.cookingButton :@"Cooking" :padding :yCoordinate :itemWidth :itemHeight];
    self.cookingButton.tag = 3;
    [self.view addSubview:self.cookingButton];
    
    self.diyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yCoordinate = *[self getRowYCoordinate:statusBarHeightWithPadding :padding :itemHeight :1];
    [self setupButton:self.diyButton :@"DIY" :rightColumnXCoordinate :yCoordinate :itemWidth :itemHeight];
    self.diyButton.tag = 4;
    [self.view addSubview:self.diyButton];

    self.educationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yCoordinate = *[self getRowYCoordinate:statusBarHeightWithPadding :padding :itemHeight :2];
    [self setupButton:self.educationButton :@"Education" :padding :yCoordinate :itemWidth :itemHeight];
    self.educationButton.tag = 5;
    [self.view addSubview:self.educationButton];

    self.musicButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yCoordinate = *[self getRowYCoordinate:statusBarHeightWithPadding :padding :itemHeight :2];
    [self setupButton:self.musicButton :@"Music" :rightColumnXCoordinate :yCoordinate :itemWidth :itemHeight];
    self.musicButton.tag = 6;
    [self.view addSubview:self.musicButton];

    self.randomButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yCoordinate = *[self getRowYCoordinate:statusBarHeightWithPadding :padding :itemHeight :3];
    [self setupButton:self.randomButton :@"Random" :padding :yCoordinate :itemWidth :itemHeight];
    self.randomButton.tag = 7;
    [self.view addSubview:self.randomButton];

    self.recreationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yCoordinate = *[self getRowYCoordinate:statusBarHeightWithPadding :padding :itemHeight :3];
    [self setupButton:self.recreationButton :@"Recreation" :rightColumnXCoordinate :yCoordinate :itemWidth :itemHeight];
    self.recreationButton.tag = 8;
    [self.view addSubview:self.recreationButton];

    self.relaxationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yCoordinate = *[self getRowYCoordinate:statusBarHeightWithPadding :padding :itemHeight :4];
    [self setupButton:self.relaxationButton :@"Relaxation" :padding :yCoordinate :itemWidth :itemHeight];
    self.relaxationButton.tag = 9;
    [self.view addSubview:self.relaxationButton];

    self.socialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yCoordinate = *[self getRowYCoordinate:statusBarHeightWithPadding :padding :itemHeight :4];
    [self setupButton:self.socialButton :@"Social" :rightColumnXCoordinate :yCoordinate :itemWidth :itemHeight];
    self.socialButton.tag = 10;
    [self.view addSubview:self.socialButton];
    
}

- (UIButton *)setupButton:(UIButton *)button :(NSString *)title :(CGFloat)x :(CGFloat)y :(CGFloat)width :(CGFloat)height {
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [button setBackgroundColor:UIColor.systemIndigoColor];
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:24];
    button.frame = CGRectMake(x, y, width, height);
    button.layer.cornerRadius = 10;
    
    [button addTarget:self action:@selector(fetchBoredAPIUsingJSON:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (CGFloat *)getRowYCoordinate :(CGFloat)statusBarHeightWithPadding :(CGFloat)padding :(CGFloat)buttonHeight :(int)buttonsAbove {
    CGFloat height = statusBarHeightWithPadding + (buttonsAbove * padding) + (buttonsAbove * buttonHeight);
    CGFloat *y = &height;
    
    return y;
}

- (void)fetchBoredAPIUsingJSON:(UIButton *)button {
    NSString *baseURL = @"https://www.boredapi.com/api/activity";
    NSString *typeQuery = @"?type=";
    NSString *urlString = baseURL;
    
    switch (button.tag) {
        case 1:
            self.activityType = @"Busy work";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"busywork"];
            break;
        case 2:
            self.activityType = @"Charity";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"charity"];
            break;
        case 3:
            self.activityType = @"Cooking";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"cooking"];
            break;
        case 4:
            self.activityType = @"DIY";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"diy"];
            break;
        case 5:
            self.activityType = @"Education";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"education"];
            break;
        case 6:
            self.activityType = @"Music";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"music"];
            break;
        case 7:
            self.activityType = @"Random";
            urlString = [urlString stringByAppendingString:@"/"];
            break;
        case 8:
            self.activityType = @"Recreation";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"recreational"];
            break;
        case 9:
            self.activityType = @"Relaxation";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"relaxation"];
            break;
        case 10:
            self.activityType = @"Social";
            urlString = [urlString stringByAppendingString:typeQuery];
            urlString = [urlString stringByAppendingString:@"social"];
            break;
        default:
            break;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Failed to get data");
            return;
        }
        
        NSError *err;
        NSDictionary *boredJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSString *boredDescription = boredJSON[@"activity"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.activityDescription = boredDescription;
            [self openActivityVC];
        });
        
    }] resume];
}

- (void)openActivityVC {
    ActivityView *activityView = [ActivityView alloc];
    activityView.activityType = self.activityType;
    activityView.activityDescription = self.activityDescription;
    
    [activityView initWithFrame:self.view.frame];
    
    [self.view addSubview:activityView];
}


@end
