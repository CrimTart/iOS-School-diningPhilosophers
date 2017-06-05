//
//  main.m
//  testDeadlock
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhilosopherThread.h"
#import "DiningFork.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray<DiningFork *> *forks = [[NSArray alloc] initWithObjects:
                                        [[DiningFork alloc] initWithPriority: 1],
                                        [[DiningFork alloc] initWithPriority: 2],
                                        [[DiningFork alloc] initWithPriority: 3],
                                        [[DiningFork alloc] initWithPriority: 4],
                                        [[DiningFork alloc] initWithPriority: 5],
                                        nil];
        NSArray<PhilosopherThread *> * phils = [[NSArray alloc] initWithObjects:
                                              [[PhilosopherThread alloc] initWithNameAndForks: @"1" :forks[0] :forks[1]],
                                              [[PhilosopherThread alloc] initWithNameAndForks: @"2" :forks[1] :forks[2]],
                                              [[PhilosopherThread alloc] initWithNameAndForks: @"3" :forks[2] :forks[3]],
                                              [[PhilosopherThread alloc] initWithNameAndForks: @"4" :forks[3] :forks[4]],
                                              [[PhilosopherThread alloc] initWithNameAndForks: @"5" :forks[4] :forks[0]],
                                              nil];
        for(int i=0; i < phils.count; i++) {
            [phils[i] start];
        }
        sleep(30);
    }
    return 0;
}
