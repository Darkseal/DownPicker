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


#import "DownPicker.h"


@implementation DownPicker
@synthesize text;

-(id)initWithTextField:(UITextField *)tf
{
    self = [super init];
    if (self) {
        self->textField = tf;
        self->textField.delegate = self;
        
        // hide the caret and its blinking
        [[textField valueForKey:@"textInputTraits"]
            setValue:[UIColor clearColor]
            forKey:@"insertionPointColor"];
        
        // set the placeholder
        self->textField.placeholder = @"Tap to choose...";
        
        // set the DownPicker arrow to the right (you can replace it with any 32x24 px transparent image: changing size might give different results)
        self->textField.rightViewMode = UITextFieldViewModeAlways;
        self->textField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"downArrow.png"]];
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    textField.text = [dataArray objectAtIndex:row];
    text = textField.text;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [dataArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [dataArray objectAtIndex:row];
}

-(void) setData:(NSMutableArray*) data
{
    dataArray = data;    
}

-(void)doneClicked:(id) sender
{
    [textField resignFirstResponder]; //hides the pickerView
}

- (IBAction)showPicker:(id)sender
{
    self->textField.placeholder = @"Pick an option...";
    pickerView = [[UIPickerView alloc] init];
    pickerView.showsSelectionIndicator = YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;

    UIToolbar* toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = UIBarStyleDefault;
    [toolbar sizeToFit];
    
    //to make the done button aligned to the right
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(doneClicked:)];
    
    
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];

    //custom input view
    textField.inputView = pickerView;
    textField.inputAccessoryView = toolbar;  
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField
{
    [self showPicker:aTextField];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}


@end
