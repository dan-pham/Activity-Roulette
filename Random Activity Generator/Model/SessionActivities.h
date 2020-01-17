//
//  SessionActivities.h
//  Random Activity Generator
//
//  Created by Dan Pham on 1/16/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SessionActivities : NSObject

@property (nonatomic, strong) NSMutableArray *sessionActivities;

+ (SessionActivities*)sharedInstance;

@end
