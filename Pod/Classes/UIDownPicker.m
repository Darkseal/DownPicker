//
//  UIDownPicker.m
//  Know
//
//  Created by DarkAngel on 29/03/15.
//  Copyright (c) 2015 Ryadel. All rights reserved.
//

#import "UIDownPicker.h"

@implementation UIDownPicker

-(id)init
{
    return [self initWithData:nil];
}

-(id)initWithData:(NSArray*)data
{
    self = [super init];
    if (self) {
        self.DownPicker = [[DownPicker alloc] initWithTextField:self withData:data];
    }
    return self;
}

@end
