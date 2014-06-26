//
//  main.m
//  NSData+SeparateByData Demo
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+SeparateByData.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString *const sampleDataDirectoryPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"sample"];
        
        BOOL isDir = NO;
        if ([[NSFileManager defaultManager] fileExistsAtPath:sampleDataDirectoryPath
                                                 isDirectory:&isDir] &&
            isDir)
        {
            { // crlf
                NSData *const sampleData = [NSData dataWithContentsOfFile:[sampleDataDirectoryPath stringByAppendingPathComponent:@"crlf.data"]];
                NSData *const separator = ({
                    Byte bytes[] = {0x0D, 0x0A};
                    [NSData dataWithBytes:bytes
                                   length:2];
                });
                
                printf("crlf sample data\n");
                printf("%s\n", [[sampleData description] UTF8String]);
                printf("components separated by crlf data\n"
                       "%s\n", [[[sampleData componentsSeparatedByDataBytes:separator] description] UTF8String]);
            }
            
            { // cr or lf
                NSData *const sampleData = [NSData dataWithContentsOfFile:[sampleDataDirectoryPath stringByAppendingPathComponent:@"cr_or_lf.data"]];
                NSSet  *const separatorSet = ({
                    NSData *const crSeparator = ({
                        Byte bytes[] = {0x0D};
                        [NSData dataWithBytes:bytes
                                       length:1];
                    });
                    
                    NSData *const lfSeparator = ({
                        Byte bytes[] = {0x0A};
                        [NSData dataWithBytes:bytes
                                       length:1];
                    });
                    
                    NSData *const crlfSeparator = ({
                        Byte bytes[] = {0x0D, 0x0A};
                        [NSData dataWithBytes:bytes
                                       length:2];
                    });

                    [NSSet setWithArray:@[crSeparator, lfSeparator, crlfSeparator]];
                });
                
                printf("cr or lf sample data\n");
                printf("%s\n", [[sampleData description] UTF8String]);
                printf("components separated by cr or lf data\n"
                       "%s\n", [[[sampleData componentsSeparatedByDataBytesInSet:separatorSet] description] UTF8String]);
            }
        }
    }
    return 0;
}

