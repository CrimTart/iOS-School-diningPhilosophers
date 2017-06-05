//
//  DiningFork.m
//  testDeadlock
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 user. All rights reserved.
//

#import "DiningFork.h"

@implementation DiningFork

-(instancetype)initWithPriority: (int)priority {
    self = [super init];
    self.lock = [NSLock new];
    self.priority = priority;
    self.taken = NO;
    return self;
}

@end
