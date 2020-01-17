//
//  FavoritesVC.m
//  Random Activity Generator
//
//  Created by Dan Pham on 1/8/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

#import "FavoritesVC.h"
#import "Activity.h"
#import "ActivityView.h"
#import "SessionActivities.h"

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
    self.view.backgroundColor = [UIColor systemIndigoColor];
    [self setupActivities];
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    [self.tableView reloadData];
}

- (void)setupActivities {
    SessionActivities *sessionActivity = [SessionActivities sharedInstance];
    self.activities = sessionActivity.sessionActivities;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.activities.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    
    tableView.separatorColor = [UIColor systemGray2Color];
    
    cell.backgroundColor = [UIColor systemIndigoColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    
    Activity *activity = self.activities[indexPath.row];
    
    cell.textLabel.text = activity.activityType;
    cell.detailTextLabel.text = activity.activityDescription;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityView *activityView = [ActivityView alloc];
    activityView.activityType = self.activities[indexPath.row].activityType;
    activityView.activityDescription = self.activities[indexPath.row].activityDescription;
    
    [activityView initWithFrame:self.view.frame];
    activityView.saveButton.hidden = YES;
    
    [self.view addSubview:activityView];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.activities removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        SessionActivities *sessionActivity = [SessionActivities sharedInstance];
        sessionActivity.sessionActivities = self.activities;
        
        [self.tableView reloadData];
    }
}

@end
