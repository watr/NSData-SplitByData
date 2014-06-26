//
//  NSData+WAHSeparateByData.m
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import "NSData+WAHSeparateByData.h"

@implementation NSData (WAHSeparateByData)

- (NSArray *)wah_componentsSeparatedByDataBytes:(NSData *const)separator
{
    NSSet *const separatorAsSet = [NSSet setWithArray:(separator ? @[separator] : @[])];
    
    return [self wah_componentsSeparatedByDataBytesInSet:separatorAsSet];
}

- (NSArray *)wah_componentsSeparatedByDataBytesInSet:(NSSet *const)separatorSet
{
    NSArray *components = nil;
    
    if (separatorSet && (separatorSet.count > 0)) {
        NSRange searchRange = NSMakeRange(0, self.length);
        
        NSMutableArray *const array = [@[] mutableCopy];
        // >Returns {NSNotFound, 0} if dataToFind is not found or is empty (@"").
        while (searchRange.location != NSNotFound) {
            
            NSRange foundRange = NSMakeRange(NSNotFound, 0);
            
            for (NSData *const separator in separatorSet) {
                NSRange const foundRangeCandidate = [self rangeOfData:separator
                                                              options:0
                                                                range:searchRange];
                if (foundRangeCandidate.location < foundRange.location) {
                    foundRange.location = foundRangeCandidate.location;
                    foundRange.length   = foundRangeCandidate.length;
                }
            }
            
            NSRange const subdataRange = ({
                NSUInteger const location = searchRange.location;
                NSUInteger const length   = (((foundRange.location != NSNotFound) ? foundRange.location : self.length) - searchRange.location);
                NSMakeRange(location, length);
            });
            
            NSData *const separatedComponent = [self subdataWithRange:subdataRange];
            if (separatedComponent) {
                [array addObject:separatedComponent];
            }
            
            { // update search range
                searchRange.location = (foundRange.location + foundRange.length);
                searchRange.length   = (self.length - searchRange.location);
            }
        }
        
        if (array.count > 0) {
            components = [NSArray arrayWithArray:array];
        }
    }
    return components;
}

@end
