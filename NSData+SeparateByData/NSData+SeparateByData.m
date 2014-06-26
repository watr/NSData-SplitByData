//
//  NSData+SeparateByData.m
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import "NSData+SeparateByData.h"
#import "NSData+WAHSeparateByData.h"

@implementation NSData (SeparateByData)

- (NSArray *)componentsSeparatedByDataBytes:(NSData *)separator
{
    return [self wah_componentsSeparatedByDataBytes:separator];
}

- (NSArray *)componentsSeparatedByDataBytesInSet:(NSSet *const)separator
{
    return [self wah_componentsSeparatedByDataBytesInSet:separator];
}

@end
