//
//  NSData+SplitByData.m
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import "NSData+SplitByData.h"
#import "NSData+WAHSplitByData.h"

@implementation NSData (SplitByData)

- (NSArray *)componentsSplitByDataBytes:(NSData *)separator
{
    return [self wah_componentsSplitByDataBytes:separator];
}

- (NSArray *)componentsSplitByDataBytesInSet:(NSSet *const)separator
{
    return [self wah_componentsSplitByDataBytesInSet:separator];
}

@end
