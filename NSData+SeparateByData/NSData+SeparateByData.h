//
//  NSData+SeparateByData.h
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SeparateByData)

- (NSArray *)componentsSeparatedByDataBytes:(NSData *)separator;

- (NSArray *)componentsSeparatedByDataBytesInSet:(NSSet *)separator;

@end
