//
//  DownPickerViewController.h
//  DownPicker
//
//  Created by Ryan on 09/10/2015.
//  Copyright (c) 2015 Ryan. All rights reserved.
//

@import UIKit;
@import DownPicker;

@interface DownPickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UIDownPicker *downPicker;
@property (weak, nonatomic) IBOutlet UIDownPicker *downPicker2;

@property (nonatomic) DownPicker *picker;
@property (nonatomic) DownPicker *picker2;

@end
