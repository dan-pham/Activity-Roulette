//
//  ViewController.m
//  Random Activity Generator
//
//  Created by Dan Pham on 1/8/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<Activity *> *activities; // make static to access from activityview

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SearchVC *searchVC = [SearchVC new];
    FavoritesVC *favoritesVC = [FavoritesVC new];
    
    NSArray *tabBarVCs = @[searchVC, favoritesVC];
    
    [self setViewControllers:tabBarVCs];
    
    searchVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
    favoritesVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
}


@end
