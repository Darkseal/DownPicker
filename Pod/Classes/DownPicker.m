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
{
    NSString* _previousSelectedString;
}

-(id)initWithTextField:(UITextField *)tf
{
    return [self initWithTextField:tf withData:nil];
}

-(id)initWithTextField:(UITextField *)tf withData:(NSArray*) data
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
        self->toolbarCancelButtonText = @"Cancel";
        
        // hide the caret and its blinking
        [[textField valueForKey:@"textInputTraits"]
         setValue:[UIColor clearColor]
         forKey:@"insertionPointColor"];
        
        // set the placeholder
        self->textField.placeholder = self->placeholder;
        
        // setup the arrow image
        UIImage* img = [UIImage imageNamed:@"downArrow.png"];   // non-CocoaPods
        if (img == nil) img = [UIImage imageNamed:@"DownPicker.bundle/downArrow.png"]; // CocoaPods
        if (img != nil) self->textField.rightView = [[UIImageView alloc] initWithImage:img];
        self->textField.rightView.contentMode = UIViewContentModeScaleAspectFit;
        self->textField.rightView.clipsToBounds = YES;
        
        // show the arrow image by default
        [self showArrowImage:YES];

        // set the data array (if present)
        if (data != nil) {
            [self setData: data];
        }
        
        self.shouldDisplayCancelButton = YES;
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
    //hides the pickerView
    [textField resignFirstResponder];
    
    if (self->textField.text.length == 0 || ![self->dataArray containsObject:self->textField.text]) {
        // self->textField.text = [dataArray objectAtIndex:0];
        [self setValueAtIndex:-1];
        self->textField.placeholder = self->placeholder;
    }
    /*
    else {
        if (![self->textField.text isEqualToString:_previousSelectedString]) {
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
    */
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

-(void)cancelClicked:(id)sender
{
    [textField resignFirstResponder]; //hides the pickerView
    if (_previousSelectedString.length == 0 || ![self->dataArray containsObject:_previousSelectedString]) {
        self->textField.placeholder = self->placeholder;
    }
    self->textField.text = _previousSelectedString;
}


- (IBAction)showPicker:(id)sender
{
    _previousSelectedString = self->textField.text;
    
    pickerView = [[UIPickerView alloc] init];
    pickerView.showsSelectionIndicator = YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    //If the text field is empty show the place holder otherwise show the last selected option
    if (self->textField.text.length == 0 || ![self->dataArray containsObject:self->textField.text])
    {
        if (self->placeholderWhileSelecting) {
            self->textField.placeholder = self->placeholderWhileSelecting;
        }
        // 0.1.31 patch: auto-select first item: it basically makes placeholderWhileSelecting useless, but
        // it solves the "first item cannot be selected" bug due to how the pickerView works.
        [self setSelectedIndex:0];
    }
    else
    {
        if ([self->dataArray containsObject:self->textField.text]) {
            [self->pickerView selectRow:[self->dataArray indexOfObject:self->textField.text] inComponent:0 animated:YES];
        }
    }

    UIToolbar* toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = self->toolbarStyle;
    [toolbar sizeToFit];
    
    //space between buttons
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil
                                                                                   action:nil];
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:self->toolbarDoneButtonText
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(doneClicked:)];
    
    if (self.shouldDisplayCancelButton) {
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc]
                                         initWithTitle:self->toolbarCancelButtonText
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(cancelClicked:)];
        
        [toolbar setItems:[NSArray arrayWithObjects:cancelButton, flexibleSpace, doneButton, nil]];
    } else {
        [toolbar setItems:[NSArray arrayWithObjects:flexibleSpace, doneButton, nil]];
    }


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

- (void)textFieldDidEndEditing:(UITextField *)aTextField {
    // [self doneClicked:aTextField];
    aTextField.userInteractionEnabled = YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

-(void) setData:(NSArray*) data
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

-(void) setAttributedPlaceholder:(NSAttributedString *)attributedString
{
    self->textField.attributedPlaceholder = attributedString;
}

-(void) setToolbarDoneButtonText:(NSString*)str
{
    self->toolbarDoneButtonText = str;
}

-(void) setToolbarCancelButtonText:(NSString*)str
{
    self->toolbarCancelButtonText = str;
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

-(NSString*) getValueAtIndex:(NSInteger)index
{
    return (self->dataArray.count > index) ? [self->dataArray objectAtIndex:index] : nil;
}

-(void) setValueAtIndex:(NSInteger)index
{
    if (index >= 0) [self pickerView:nil didSelectRow:index inComponent:0];
    else [self setText:nil];
}

/**
 Getter for text property.
 @return
 The value of the selected item or NIL NIL if nothing has been selected yet.
 */
- (NSString*) text {
    return self->textField.text;
}

/**
 Setter for text property.
 @param txt
 The value of the item to select or NIL to clear selection.
 */
- (void) setText:(NSString*)txt {
    if (txt != nil) {
        NSInteger index = [self->dataArray indexOfObject:txt];
        if (index != NSNotFound) [self setValueAtIndex:index];
    }
    else {
        self->textField.text = txt;
    }
}

/**
 Getter for selectedIndex property.
 @return
 The zero-based index of the selected item or -1 if nothing has been selected yet.
 */
- (NSInteger)selectedIndex {
    NSInteger index = [self->dataArray indexOfObject:self->textField.text];
    return (index != NSNotFound) ? (NSInteger)index : -1;
}

/**
 Setter for selectedIndex property.
 @param index
 Sets the zero-based index of the selected item using the setValueAtIndex method: -1 can be used to clear selection.
 */
- (void)setSelectedIndex:(NSInteger)index {
    [self setValueAtIndex:(NSInteger)index];
}

@end
