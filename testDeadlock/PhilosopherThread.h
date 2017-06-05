//
//  PhilosopherThread.h
//  testDeadlock
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DiningFork;

@interface PhilosopherThread : NSThread

@property (nonatomic, weak) DiningFork *left;
@property (nonatomic, weak) DiningFork *right;

- (instancetype)initWithNameAndForks: (NSString *)name : (DiningFork *)left : (DiningFork *)right;

@end
