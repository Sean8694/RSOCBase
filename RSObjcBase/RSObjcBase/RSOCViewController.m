//
//  RSOCViewController.m
//  RSObjcBase
//
//  Created by ran.shi on 14/11/5.
//  Copyright (c) 2014年 Sean. All rights reserved.
//

#import "RSOCViewController.h"

@interface RSOCViewController ()

@end

@implementation RSOCViewController

+ (instancetype)getInstance
{
    RSOCViewController *viewController = [[UIStoryboard storyboardWithName:NSStringFromClass(self) bundle:nil] instantiateInitialViewController];
    if ([viewController isKindOfClass:self]) {
        return viewController;
    }
    return nil;
}

@end
