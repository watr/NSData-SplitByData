//
//  NSData+WAHSeparateByData.h
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (WAHSeparateByData)

- (NSArray *)wah_componentsSeparatedByDataBytes:(NSData *)separator;

- (NSArray *)wah_componentsSeparatedByDataBytesInSet:(NSSet *)separator;

@end
