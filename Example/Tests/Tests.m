//
//  Tests.m
//  DownPickerTests
//
//  Created by Ryan on 08/26/2015.
//  Copyright (c) 2015 Ryan. All rights reserved.
//

@import XCTest;
@import DownPicker;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)initAsWrapper
{
    // create the array of data
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@"Offsprings"];
    [bandArray addObject:@"Radiohead"];
    [bandArray addObject:@"Muse"];
    [bandArray addObject:@"R.E.M."];
    [bandArray addObject:@"The Killers"];
    [bandArray addObject:@"Social Distortion"];
    
    UITextField *tf = [[UITextField alloc] init];
    // bind yourTextField to DownPicker
    DownPicker *dp = [[DownPicker alloc] initWithTextField:tf withData:bandArray];
    XCTAssertNotNil(dp, @"Cannot find DownPicker instance");
    // no teardown needed
}

- (void)initAsUIControl
{
    // create the array of data
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@"Offsprings"];
    [bandArray addObject:@"Radiohead"];
    [bandArray addObject:@"Muse"];
    [bandArray addObject:@"R.E.M."];
    [bandArray addObject:@"The Killers"];
    [bandArray addObject:@"Social Distortion"];
    
    UIDownPicker* dp = [[UIDownPicker alloc] initWithData:bandArray];
    XCTAssertNotNil(dp, @"Cannot find UIDownPicker instance");
    // no teardown needed
}

@end

