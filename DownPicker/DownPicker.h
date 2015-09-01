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

#import <UIKit/UIKit.h>

@interface DownPicker : UIControl<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    UIPickerView* pickerView;
    IBOutlet UITextField* textField;
    NSMutableArray* dataArray;
    NSString* placeholder;
    NSString* placeholderWhileSelecting;
	NSString* toolbarDoneButtonText;
    NSString* toolbarCancelButtonText;
	UIBarStyle toolbarStyle;
}

@property (nonatomic) NSString* text;
@property (nonatomic) NSInteger* selectedIndex;

-(id)initWithTextField:(UITextField *)tf;
-(id)initWithTextField:(UITextField *)tf withData:(NSMutableArray*) data;
-(void) setArrowImage:(UIImage*)image;
-(void) setData:(NSMutableArray*) data;
-(void) setPlaceholder:(NSString*)str;
-(void) setPlaceholderWhileSelecting:(NSString*)str;
-(void) setToolbarDoneButtonText:(NSString*)str;
-(void) setToolbarStyle:(UIBarStyle)style;
-(void) showArrowImage:(BOOL)b;
-(UIPickerView*) getPickerView;
-(UITextField*) getTextField;
-(NSString*) getValueAtIndex:(NSInteger)index;
-(void) setValueAtIndex:(NSInteger)index;
@end
