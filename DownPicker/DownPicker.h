//
//   DownPicker.h
// --------------------------------------------------------
//      Lightweight DropDownList/ComboBox control for iOS
//
// by Darkseal, 2013-2015 - MIT License
//
// Website: http://www.ryadel.com/
// GitHub:  https://github.com/Darkseal/DownPicker
//

#import <UIKit/UIKit.h>

@interface DownPicker : NSObject<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    UIPickerView* pickerView;
    IBOutlet UITextField* textField;
    NSMutableArray* dataArray;
}

@property (retain, nonatomic) NSString* text;

-(id)initWithTextField:(UITextField *)tf;
-(void) setData:(NSMutableArray*) data;
@end
