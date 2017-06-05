//
//  DiningFork.h
//  testDeadlock
//
//  Created by iOS-School-1 on 13.05.17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiningFork : NSObject

@property (nonatomic) NSLock *lock;
@property (atomic) int priority;
@property (atomic) BOOL taken;

-(instancetype)initWithPriority: (int)priority;

@end
