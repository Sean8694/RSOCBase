//
//  UIColor+RSOCAddition.h
//  RSObjcBase
//
//  Created by ran.shi on 14/11/5.
//  Copyright (c) 2014年 Sean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RSOCAddition)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(float)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
