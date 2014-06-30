//
//  NSData+SplitByData.h
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SplitByData)

- (NSArray *)componentsSplitByDataBytes:(NSData *)separator;

- (NSArray *)componentsSplitByDataBytesInSet:(NSSet *)separator;

@end
