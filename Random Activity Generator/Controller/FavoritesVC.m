//
//  FavoritesVC.m
//  Random Activity Generator
//
//  Created by Dan Pham on 1/8/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

#import "FavoritesVC.h"
#import "Activity.h"

@interface FavoritesVC ()

@property (strong, nonatomic) NSMutableArray<Activity *> *activities;

@end

@implementation FavoritesVC

NSString *cellId = @"cellId";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemGray2Color];
    [self setupActivities];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
}

- (void)setupActivities {
    self.activities = NSMutableArray.new;
    
    Activity *activity = Activity.new;
    activity.activityType = @"Cooking";
    activity.activityDescription = @"Learn a new sushi roll";
    [self.activities addObject:activity];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.activities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    
    Activity *activity = self.activities[indexPath.row];
    
    cell.textLabel.text = activity.activityType;
    cell.detailTextLabel.text = activity.activityDescription;
    
    return cell;
}

@end
