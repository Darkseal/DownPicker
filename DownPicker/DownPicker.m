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
// @synthesize text;

-(id)initWithTextField:(UITextField *)tf
{
    return [self initWithTextField:tf withData:nil];
}

-(id)initWithTextField:(UITextField *)tf withData:(NSMutableArray*) data
{
    self = [super init];
    if (self) {
        self->textField = tf;
        self->textField.delegate = self;
        
        // set UI defaults
        self->toolbarStyle = UIBarStyleDefault;
		
        // set language defaults
        self->placeholder = @"Tap to choose...";
        self->placeholderWhileSelecting = @"Pick an option...";
		self->toolbarDoneButtonText = @"Done";
        
        // hide the caret and its blinking
        [[textField valueForKey:@"textInputTraits"]
         setValue:[UIColor clearColor]
         forKey:@"insertionPointColor"];
        
        // set the placeholder
        self->textField.placeholder = self->placeholder;
        
        // show the arrow image
        self->textField.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"downArrow.png"]];
        self->textField.rightView.contentMode = UIViewContentModeScaleAspectFit;
        self->textField.rightView.clipsToBounds = YES;
        [self setArrowImage:[UIImage imageNamed:@"downArrow.png"]];
        [self showArrowImage:YES];

        // set the data array (if present)
        if (data != nil) {
            [self setData: data];
        }
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
    self->textField.text = [dataArray objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [dataArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [dataArray objectAtIndex:row];
}

-(void)doneClicked:(id) sender
{
    [textField resignFirstResponder]; //hides the pickerView
    if (self->textField.text.length == 0) {
        self->textField.text = [dataArray objectAtIndex:0];
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (IBAction)showPicker:(id)sender
{
    pickerView = [[UIPickerView alloc] init];
    pickerView.showsSelectionIndicator = YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    //If the text field is empty show the place holder otherwise show the last selected option
    if (self->textField.text.length == 0)
    {
      self->textField.placeholder = self->placeholderWhileSelecting;
    }
    else
    {
      [self->pickerView selectRow:[self->dataArray indexOfObject:self->textField.text] inComponent:0 animated:YES];
    }

    UIToolbar* toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = self->toolbarStyle;
    [toolbar sizeToFit];
    
    //to make the done button aligned to the right
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:self->toolbarDoneButtonText
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
    if ([self->dataArray count] > 0) {
        [self showPicker:aTextField];
        return YES;
    }
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

// Utility Methods
-(void) setData:(NSMutableArray*) data
{
    dataArray = data;
}

-(void) showArrowImage:(BOOL)b
{
    if (b == YES) {
      // set the DownPicker arrow to the right (you can replace it with any 32x24 px transparent image: changing size might give different results)
        self->textField.rightViewMode = UITextFieldViewModeAlways;
    }
    else {
        self->textField.rightViewMode = UITextFieldViewModeNever;
    }
}

-(void) setArrowImage:(UIImage*)image
{
    [(UIImageView*)self->textField.rightView setImage:image];
}

-(void) setPlaceholder:(NSString*)str
{
    self->placeholder = str;
    self->textField.placeholder = self->placeholder;
}

-(void) setPlaceholderWhileSelecting:(NSString*)str
{
    self->placeholderWhileSelecting = str;
}

-(void) setToolbarDoneButtonText:(NSString*)str
{
    self->toolbarDoneButtonText = str;
}

-(void) setToolbarStyle:(UIBarStyle)style;
{
    self->toolbarStyle = style;
}

-(UIPickerView*) getPickerView
{
    return self->pickerView;
}

-(UITextField*) getTextField
{
    return self->textField;
}

-(void) setValueAtIndex:(NSInteger)index
{
    [self pickerView:nil didSelectRow:index inComponent:0];
}


//Getter method for self.text
- (NSString*) text {
    return self->textField.text;
}

@end
