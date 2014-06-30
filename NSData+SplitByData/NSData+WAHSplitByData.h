//
//  NSData+WAHSplitByData.h
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (WAHSplitByData)

- (NSArray *)wah_componentsSplitByDataBytes:(NSData *)separator;

- (NSArray *)wah_componentsSplitByDataBytesInSet:(NSSet *)separator;

@end
