//
//  RSOCModule.m
//  RSObjcBase
//
//  Created by ran.shi on 14/11/5.
//  Copyright (c) 2014年 Sean. All rights reserved.
//

#import "RSOCModule.h"
#import <objc/objc-runtime.h>

@implementation RSOCModule

#pragma mark - RSOCFactoryModuleProtocol addictional

+ (instancetype)getInstance
{
    return [self getInstanceWithDictionary:@{}];
}

+ (instancetype)getInstanceWithDictionary:(NSDictionary *)dictionary
{
    RSOCModule *module = [[[self class] alloc] init];
    [module updateWithDictionary:dictionary];
    return module;
}

- (void)updateWithDictionary:(NSDictionary *)dictionary
{
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for(int i = 0; i < outCount; i++) {
        const char *propertyName = property_getName(properties[i]);
        if (dictionary[@(propertyName)]) {
            [self setValue:dictionary[@(propertyName)] forKey:@(propertyName)];
        }
    }
}

- (NSDictionary *)getDictionary
{
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:outCount];
    for(int i = 0; i < outCount; i++) {
        const char *propertyName = property_getName(properties[i]);
        if ([self valueForKey:@(propertyName)]) {
            [propertiesArray addObject: [NSString stringWithUTF8String:propertyName]];
        }
    }
    free(properties);
    return [self dictionaryWithValuesForKeys:propertiesArray];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    RSOCModule *module = [[self class] allocWithZone:zone];
    [module updateWithDictionary:[self getDictionary]];
    return module;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        unsigned count;
        objc_property_t *properties = class_copyPropertyList([self class], &count);
        for (int i = 0; i < count; i++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
            id value = [aDecoder decodeObjectForKey:propertyName];
            if (value) {
                [self setValue:value forKey:propertyName];
            }
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id value = [self valueForKey:propertyName];
        if (value) {
            [aCoder encodeObject:value forKey:propertyName];
        }
    }
    free(properties);
}

@end
