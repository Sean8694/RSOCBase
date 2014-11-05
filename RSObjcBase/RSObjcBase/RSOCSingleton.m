//
//  RSOCSingleton.m
//  RSObjcBase
//
//  Created by ran.shi on 14/11/5.
//  Copyright (c) 2014年 Sean. All rights reserved.
//

#import "RSOCSingleton.h"

static NSMutableDictionary *rsocSingletonSharedInstances = nil;

@implementation RSOCSingleton

+ (instancetype)sharedInstance
{
    @synchronized(self) {
        if (!rsocSingletonSharedInstances) {
            rsocSingletonSharedInstances = [NSMutableDictionary dictionary];
        }
        id sharedInstance = [rsocSingletonSharedInstances objectForKey:NSStringFromClass(self)];
        if (!sharedInstance) {
            sharedInstance = [[self alloc] init];
            [rsocSingletonSharedInstances setValue:sharedInstance forKey:NSStringFromClass(self)];
        }
    }
    return [rsocSingletonSharedInstances objectForKey:NSStringFromClass(self)];
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (!rsocSingletonSharedInstances) {
            rsocSingletonSharedInstances = [NSMutableDictionary dictionary];
        }
        id sharedInstance = [rsocSingletonSharedInstances objectForKey:NSStringFromClass(self)];
        if (!sharedInstance) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return nil;
}

@end
