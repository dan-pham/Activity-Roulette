//
//  ActivityView.h
//  Random Activity Generator
//
//  Created by Dan Pham on 1/9/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"

@interface ActivityView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *descriptionTextView;

@property (assign, nonatomic) NSString *activityType;
@property (assign, nonatomic) NSString *activityDescription;

@end
