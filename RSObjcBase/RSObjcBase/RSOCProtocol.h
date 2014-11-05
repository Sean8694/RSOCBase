//
//  RSOCProtocol.h
//  RSObjcBase
//
//  Created by ran.shi on 14/11/5.
//  Copyright (c) 2014年 Sean. All rights reserved.
//

#ifndef RSObjcBase_RSOCProtocol_h
#define RSObjcBase_RSOCProtocol_h

@protocol RSOCFactoryProtocol <NSObject>

+ (instancetype)getInstance;

@end

@protocol RSOCModuleFactoryProtocol <RSOCFactoryProtocol, NSCopying, NSCoding>

+ (instancetype)getInstanceWithDictionary:(NSDictionary *)dictionary;
- (void)updateWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)getDictionary;

@end

@protocol RSOCSingletonProtocol <NSObject>

+ (instancetype)sharedInstance;

@end

#endif
