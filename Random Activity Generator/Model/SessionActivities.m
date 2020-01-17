//
//  SessionActivities.m
//  Random Activity Generator
//
//  Created by Dan Pham on 1/16/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

#import "SessionActivities.h"

static SessionActivities *sharedInstance;

@interface SessionActivities()

@end

@implementation SessionActivities

+ (SessionActivities*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SessionActivities alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sessionActivities = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
