//
//  DownPickerViewController.m
//  DownPicker
//
//  Created by Ryan on 09/10/2015.
//  Copyright (c) 2015 Ryan. All rights reserved.
//

#import "DownPickerViewController.h"

@interface DownPickerViewController ()

@end

@implementation DownPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *el = @[@"R.E.M.", @"Dire Straits", @"Police", @"Sex Pistols", @"Pink Floyd"];
    self.picker = [[DownPicker alloc] initWithTextField:self.textField withData:el];
    
    NSArray *el2 = @[@"Prodigy", @"Arctic Monkeys", @"System of a Down", @"Limp Bizkit", @"Linkin Park"];
    self.picker2 = [[DownPicker alloc] initWithTextField:self.textField2 withData:el2];
    
    NSArray *el3 = @[@"Iron Maiden", @"Metallica", @"AC/DC", @"Diamondhead", @"Helloween"];
   
    (void)[self.downPicker initWithData:el3];
    
    NSArray *el4 = @[@"Dream Theater", @"Stratovarius", @"Tool", @"A Perfect Circle", @"Shadow Gallery"];
    (void)[self.downPicker2 initWithData:el4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
