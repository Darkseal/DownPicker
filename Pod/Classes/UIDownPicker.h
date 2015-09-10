//
//   DownPicker.h
// --------------------------------------------------------
//      Lightweight DropDownList/ComboBox control for iOS
//
// by Darkseal, 2013-2015 - MIT License
//
// Website: http://www.ryadel.com/
// GitHub:  http://www.ryadel.com/
//

#import <Foundation/Foundation.h>
#import "DownPicker.h"

@interface UIDownPicker : UITextField

@property (strong, nonatomic) DownPicker *DownPicker;

-(id)initWithData:(NSArray*)data;

@end
