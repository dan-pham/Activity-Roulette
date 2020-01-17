//
//  ActivityView.m
//  Random Activity Generator
//
//  Created by Dan Pham on 1/9/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

#import "ActivityView.h"
#import "SessionActivities.h"

@interface ActivityView ()

@property (nonatomic, strong) UIView *activityView;
@property (nonatomic, strong) UIButton *exitButton;
@property (nonatomic, strong) UIButton *saveButton;

@end

@implementation ActivityView

@synthesize activityType;
@synthesize activityDescription;

NSString *actDescription = @"";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        actDescription = self.activityDescription;
        
        [self showActivityView:frame];
        [self configureExitButton];
        [self configureSaveButton];
        [self configureTitleLabel:self.activityType];
        [self configureDescriptionTextView:self.activityDescription];
    }
    return self;
}

- (void)showActivityView:(CGRect)frame {
    self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.80];
    
    CGFloat xCoordinate = frame.size.width / 12;
    CGFloat yCoordinate = frame.size.height / 4;
    CGFloat width = frame.size.width * 5 / 6;
    CGFloat height = frame.size.height / 3;
    
    self.activityView = [[UIView alloc] initWithFrame:CGRectMake(xCoordinate, yCoordinate, width, height)];
    self.activityView.backgroundColor = [UIColor systemIndigoColor];
    self.activityView.layer.cornerRadius = 10;
    
    [self addSubview:self.activityView];
}

- (void)configureExitButton {
    self.exitButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.exitButton setTitle:@"X" forState:UIControlStateNormal];
    [self.exitButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.exitButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:24];
    self.exitButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.exitButton.backgroundColor = UIColor.clearColor;
    self.exitButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.exitButton];
    [self.exitButton addTarget:self action:@selector(exitActivity) forControlEvents:UIControlEventTouchUpInside];
    
    [self.exitButton.topAnchor constraintEqualToAnchor:self.activityView.topAnchor constant:8].active = YES;
    [self.exitButton.leadingAnchor constraintEqualToAnchor:self.activityView.leadingAnchor constant:16].active = YES;
    [self.exitButton.heightAnchor constraintEqualToConstant:40].active = YES;
    [self.exitButton.widthAnchor constraintEqualToConstant:40].active = YES;
}

- (void)exitActivity {
    [self dismissActivityView];
}

- (void)configureSaveButton {
    self.saveButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.saveButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:24];
    self.saveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.saveButton.backgroundColor = UIColor.clearColor;
    self.saveButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.saveButton];
    [self.saveButton addTarget:self action:@selector(saveActivity) forControlEvents:UIControlEventTouchUpInside];
    
    [self.saveButton.topAnchor constraintEqualToAnchor:self.activityView.topAnchor constant:8].active = YES;
    [self.saveButton.leadingAnchor constraintEqualToAnchor:self.exitButton.trailingAnchor constant:8].active = YES;
    [self.saveButton.trailingAnchor constraintEqualToAnchor:self.activityView.trailingAnchor constant:-16].active = YES;
    [self.saveButton.heightAnchor constraintEqualToConstant:40].active = YES;
}

- (void)saveActivity {
    Activity *activity = Activity.new;
    activity.activityType = self.activityType;
    activity.activityDescription = actDescription;
    
    SessionActivities *sessionActivity = [SessionActivities sharedInstance];
    [sessionActivity.sessionActivities addObject:activity];

    [self dismissActivityView];
}

- (void)dismissActivityView {
    [self removeFromSuperview];
}

- (void)configureTitleLabel:(NSString *)title {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:30];
    self.titleLabel.textColor = UIColor.whiteColor;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.minimumScaleFactor = 0.9;
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.titleLabel];
    self.titleLabel.text = title;
    
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.exitButton.bottomAnchor constant:0].active = YES;
    [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.activityView.leadingAnchor constant:16].active = YES;
    [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.activityView.trailingAnchor constant:-16].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:34].active = YES;
}

- (void)configureDescriptionTextView:(NSString *)description {
    self.descriptionTextView = [[UITextView alloc] initWithFrame:CGRectZero];
    self.descriptionTextView.font = [UIFont fontWithName:@"Helvetica" size:20];
    self.descriptionTextView.textColor = UIColor.whiteColor;
    self.descriptionTextView.backgroundColor = UIColor.clearColor;
    self.descriptionTextView.userInteractionEnabled = NO;
    self.descriptionTextView.scrollEnabled = NO;
    self.descriptionTextView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.descriptionTextView];
    self.descriptionTextView.text = description;
    
    [self.descriptionTextView.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:0].active = YES;
    [self.descriptionTextView.leadingAnchor constraintEqualToAnchor:self.activityView.leadingAnchor constant:16].active = YES;
    [self.descriptionTextView.trailingAnchor constraintEqualToAnchor:self.activityView.trailingAnchor constant:-16].active = YES;
    [self.descriptionTextView.bottomAnchor constraintEqualToAnchor:self.activityView.bottomAnchor constant:-16].active = YES;
}

@end
