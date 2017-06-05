//
//  PhilosopherThread.m
//  testDeadlock
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 user. All rights reserved.
//

#import "PhilosopherThread.h"
#import "DiningFork.h"

@implementation PhilosopherThread

- (instancetype)initWithNameAndForks: (NSString *)name : (DiningFork *)left : (DiningFork *)right {
    self = [super init];
    self.name = name;
    self.left = left;
    self.right = right;
    return self;
}

- (void) eatWithLocks {
    //взять левую вилку
    [self.left.lock lock];
    //взять правую вилку
    [self.right.lock lock];
    //sleep & nslog
    NSLog(@"Philosopher %@ eating (locks)", self.name);
    sleep(1);
    //положить правую вилку
    [self.right.lock unlock];
    //положить левую вилку
    [self.left.lock unlock];
}

-(void) eatWithPriorities {
    if(self.left.priority < self.right.priority) {
        while(self.left.taken) continue;
        self.left.taken = YES;
        while(self.right.taken) continue;
        self.right.taken = YES;
    }
    else {
        while(self.right.taken) continue;
        self.right.taken = YES;
        while(self.left.taken) continue;
        self.left.taken = YES;
    }
    NSLog(@"Philosopher %@ eating (priorities)", self.name);
    self.left.taken = NO;
    self.right.taken = NO;
}

-(void) main {
    [self eatWithLocks];
    sleep(5);
    [self eatWithPriorities];
}

@end
