//
//  RSOCTableViewController.m
//  RSObjcBase
//
//  Created by ran.shi on 14/11/5.
//  Copyright (c) 2014年 Sean. All rights reserved.
//

#import "RSOCTableViewController.h"

@interface RSOCTableViewController ()

@end

@implementation RSOCTableViewController

+ (instancetype)getInstance
{
    RSOCTableViewController *viewController = [[UIStoryboard storyboardWithName:NSStringFromClass(self) bundle:nil] instantiateInitialViewController];
    if ([viewController isKindOfClass:self]) {
        return viewController;
    }
    return nil;
}

@end
