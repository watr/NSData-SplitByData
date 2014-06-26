//
//  NSData_SeparateByData_Tests.m
//  NSData+SeparateByData Tests
//
//  Created by HASHIMOTO Wataru on 6/24/14.
//  Copyright (c) 2014 HASHIMOTO Wataru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSData+WAHSeparateByData.h"

#define PRINT_COMPONENTS_AS_STRING (false)

@interface NSData_SeparateByData_Tests : XCTestCase

@property (copy)           NSString *sampleDirectoryPath;
@property (copy, readonly) NSString *sampleDataFileName;
@property (strong)         NSData *sampleData;

- (void)test;

@end

@implementation NSData_SeparateByData_Tests

- (void)setUp
{
    [super setUp];
    self.sampleDirectoryPath = [[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:@"sample"];
    NSAssert(self.sampleDirectoryPath, @"sample path is nil");
    
    if (self.sampleDataFileName) {
        NSString *sampleDataPath = [self.sampleDirectoryPath stringByAppendingPathComponent:self.sampleDataFileName];
        
        BOOL isDir = NO;
        if ([[NSFileManager defaultManager] fileExistsAtPath:sampleDataPath
                                                 isDirectory:&isDir] &&
            (! isDir))
        {
            self.sampleData = [NSData dataWithContentsOfFile:sampleDataPath];
        }
    }
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test
{
    ;
}

@end

@interface CRLFDataTests : NSData_SeparateByData_Tests

@end

@implementation CRLFDataTests

- (NSString *)sampleDataFileName
{
    return @"crlf.data";
}

- (void)test
{
    [super test];
    NSAssert(self.sampleData, @"sample data is nil");
    
    NSData *crlfSeparator = ({
        Byte bytes[] = {0x0D, 0x0A};
        [NSData dataWithBytes:bytes
                       length:2];
    });
    NSArray *components = [self.sampleData wah_componentsSeparatedByDataBytes:crlfSeparator];
    
#if PRINT_COMPONENTS_AS_STRING
    for (NSData *data in components) {
        NSString *string = [[NSString alloc] initWithBytes:data.bytes
                                                    length:data.length
                                                  encoding:NSUTF8StringEncoding];
        printf("%s\n", [string UTF8String]);
    }
#endif
    
    XCTAssert((components.count == 8), @"components count not equals 8");
}

@end

@interface CRorLFDataTests : NSData_SeparateByData_Tests

@end

@implementation CRorLFDataTests

- (NSString *)sampleDataFileName
{
    return @"cr_or_lf.data";
}

- (void)test
{
    [super test];
    NSAssert(self.sampleData, @"sample data is nil");
    
    NSSet *separatorSet = ({
        NSData *crSeparator = ({
            Byte bytes[] = {0x0D};
            [NSData dataWithBytes:bytes
                           length:1];
        });
        
        NSData *lfSeparator = ({
            Byte bytes[] = {0x0A};
            [NSData dataWithBytes:bytes
                           length:1];
        });
        
        NSData *crlfSeparator = ({
            Byte bytes[] = {0x0D, 0x0A};
            [NSData dataWithBytes:bytes
                           length:2];
        });
        [NSSet setWithArray:@[crSeparator,
                              lfSeparator,
                              crlfSeparator]];
    });
    
    
    
    NSArray *components = [self.sampleData wah_componentsSeparatedByDataBytesInSet:separatorSet];
    
#if PRINT_COMPONENTS_AS_STRING
    for (NSData *data in components) {
        NSString *string = [[NSString alloc] initWithBytes:data.bytes
                                                    length:data.length
                                                  encoding:NSUTF8StringEncoding];
        printf("%s\n", [string UTF8String]);
    }
#endif
    
    XCTAssert((components.count == 8), @"components count not equals 8");
}

@end