//
//  NSDictionary+RSOCAddition.m
//  RSObjcBase
//
//  Created by ran.shi on 14/11/5.
//  Copyright (c) 2014年 Sean. All rights reserved.
//

#import "NSDictionary+RSOCAddition.h"

@implementation NSDictionary (RSOCAddition)

- (NSDictionary *)keysConvertWithDictionary:(NSDictionary *)dictionary
{
    NSMutableDictionary *toRet = [NSMutableDictionary dictionaryWithDictionary:self];
    for (NSString *key in dictionary.allKeys) {
        id value = toRet[key];
        if (value) {
            toRet[dictionary[key]] = value;
            [toRet removeObjectForKey:key];
        }
    }
    return toRet;
}

@end
